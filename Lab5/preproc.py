
mems = []
import re
with open("mon2.log","r") as f:
    for line in f.readlines():
        if "memory" in line:
            print(re.search("\d+",line).group(0))