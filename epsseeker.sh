#!/bin/bash

usage() {
  echo "Usage: $0 [-c cve] [-d date] [-D days] [-g epss-gt] [-G percentile-gt] [-l epss-lt] [-L percentile-lt]" 1>&2
  exit 1
}

while getopts "c:d:D:g:G:l:L:" opt; do
  case ${opt} in
    c )
      cve=$OPTARG
      ;;
    d )
      date=$OPTARG
      ;;
    D )
      days=$OPTARG
      ;;
    g )
      epss_gt=$OPTARG
      ;;
    G )
      percentile_gt=$OPTARG
      ;;
    l )
      epss_lt=$OPTARG
      ;;
    L )
      percentile_lt=$OPTARG
      ;;
    * )
      usage
      ;;
  esac
done

if [ -z "${cve}" ]; then
  echo "Error: The -c option is required" >&2
  usage
fi

api_url="https://api.first.org/data/v1/epss"

curl_cmd="curl -sS -X GET '${api_url}?cve=${cve}"
if [ -n "${date}" ]; then
  curl_cmd="${curl_cmd}&date=${date}"
fi
if [ -n "${days}" ]; then
  curl_cmd="${curl_cmd}&days=${days}"
fi
if [ -n "${epss_gt}" ]; then
  curl_cmd="${curl_cmd}&epss-gt=${epss_gt}"
fi
if [ -n "${percentile_gt}" ]; then
  curl_cmd="${curl_cmd}&percentile-gt=${percentile_gt}"
fi
if [ -n "${epss_lt}" ]; then
  curl_cmd="${curl_cmd}&epss-lt=${epss_lt}"
fi
if [ -n "${percentile_lt}" ]; then
  curl_cmd="${curl_cmd}&percentile-lt=${percentile_lt}"
fi

curl_cmd="${curl_cmd}&pretty=true'"

eval $curl_cmd
