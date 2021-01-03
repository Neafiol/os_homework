#! /bin/bash
sudo grep -E -r -h "*(Warning|Initialization)*"  /var/log/syslog > full2.log
