man bash | grep -oi "[a-z]\{4,\}" | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -r -n | head -1