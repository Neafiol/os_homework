#! /bin/bash
ps -au --sort stime | tail -n 1 | awk '{ print $2 }'