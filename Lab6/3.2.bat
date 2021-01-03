net stop DNS-client
:: sleep 3c
ping -n 3 127.0.0.1 >nul

net start > services2.txt
fc /A services.txt services2.txt > services_.txt
net start DNS-client