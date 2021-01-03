#! /bin/bash
sudo egrep -iroh -I '[a-z0-9._]+@[a-z0-9.]+\.[a-z]+' /etc/ | uniq |  tr '\n' ,  > emails.lst
