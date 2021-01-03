
ping -n 60 127.0.0.1 >nul


schtasks /create /sc minute /mo 1 /TN testtask /tr "xcopy /Z %cd%\testfile.txt \\%computername%\temp\testfile.txt"
