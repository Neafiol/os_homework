mkdir C:\LAB6
wmic os get Caption,FreePhysicalMemory,TotalVisibleMemorySize > C:\LAB6\wmic.txt
wmic logicaldisk get name, description >> C:\LAB6\wmic.txt