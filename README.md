# EPSSeekr

This is a simple Bash script that allows you to query the EPSS (Exploit Prediction Scoring System) API using various parameters, such as CVE name, date, and EPSS score. The script uses the `curl` command to send requests to the EPSS API and retrieve data in JSON format.

## Requirements

- `curl` 

## Installation

1. Download the `epss_api.sh` script and save it to a directory of your choice.
2. Make the script executable by running the following command in your terminal:

    ```
    chmod +x epss_api.sh
    ```
3. enjoy :)

## Usage

The `epss_api.sh` script accepts several command-line options that you can use to customize your API queries. The following options are available:

- `-c` (required): Filter by EPSS CVE ID. Multiple values are supported separated by commas. The maximum size accepted for this parameter is 2000 characters (including commas).
- `-d`: Filter by date in the format YYYY-MM-DD (since May 03, 2023), shows the historic values for epss and percentile attributes.
- `-D`: Filter by number of days since the EPSS score was added to the database (starting at 1, not affected by the date parameter).
- `-g`: Only display CVEs with EPSS score greater or equal than the parameter.
- `-G`: Only display CVEs with percentile greater or equal than the parameter.
- `-l`: Only display CVEs with EPSS score lower or equal than the parameter.
- `-L`: Only display CVEs with percentile lower or equal than the parameter.

To use the script, simply run it in your terminal with the relevant options and arguments. Here are some examples:

`./epss_api.sh -c "CVE-2021-40438`
This will retrieve EPSS data for CVE-2021-40438

`./epss_api.sh -c "CVE-2021-40438" -g 6.5 -G 80`
This will retrieve EPSS data for the CVE "CVE-2021-40438" with an EPSS score greater than or equal to 6.5 and a percentile greater than or equal to 80.

## Acknowledgments

I created this tool using the EPSS API provided by FIRST.org.


