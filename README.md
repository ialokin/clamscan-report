# clamscan-report #

A small BASH script that scans one or more directories using clamscan/clamav and sends the results to the defined email address.

clamscan-report is Copyright (C) Nikolai Stensen and released under the MIT License.

### Requirements ###

* This script has been tested on Debian and Ubuntu but should work on most systems.
* You need ClamAV installed (apt-get install clamav)

### Quick install ###

	cd /tmp && git clone https://github.com/ialokin/clamscan-report.git
	cp /tmp/clamscan-report/bin/clamscan-report.sh /usr/sbin/clamscan-report.sh

	chmod u+x /usr/sbin/clamscan-report.sh
    chown root:root /usr/sbin/clamscan-report.sh

Now simple configure the script using the variables near the top

	nano /usr/sbin/clamscan-report.sh
