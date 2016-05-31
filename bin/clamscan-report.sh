#!/bin/bash
###
# clamscan-report.sh
#
# Simple shell script that scans the defined directories using clamscan/ClamAV
# and sends you the output (results) by email.
#
# Copyright (c) 2016 Nikolai Stensen < post@ialokin.no >
#
# Permission is hereby granted, free of charge, to any person obtainin a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# urnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY  CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT,  TORT OR OTHERWISE, ARISING 
# FROM, OUT OF OR IN CONNECTION WITH THE  SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE
###

# where to send the report:
CSR_MAILTO="root@localhost"

#  what subject to put in the email.
CSR_MAILSUBJ="clamscan report - $(hostname)"

# space seperated list of directories you want to scan.
CSR_DIRECTORIES="/var/www /home /root";

# temporary file where we store the data before sending it.
CSR_TMPFILE="/tmp/clamscan-report-$(date +'%Y-%m-%d')";

###

if [ -e "$CSR_TMPFILE" ]; then
  rm -r "$CSR_TMPFILE";
fi

for CSR_CURDIR in $CSR_DIRECTORIES; do
  echo "Started clamav scan in: $CSR_CURDIR" >> "$CSR_TMPFILE"
  clamscan -ri "$CSR_CURDIR" >> "$CSR_TMPFILE";
  echo " " >> "$CSR_TMPFILE";
done

mail -s "$CSR_MAILSUBJ" "$CSR_MAILTO" < "$CSR_TMPFILE"

rm -r "$CSR_TMPFILE"