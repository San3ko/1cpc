# 1c support updater script
# by Ivan Tyurin
# winny.ru 2013
#prepare
0 > C:\temp\update\end.ini	#nulling signal-file
$marker = 1
#script
$app = Start-Process cmd -PassThru	#start programm
$date = date	#get date
"$date start update" >> C:\temp\update\update.log	#create log-entry
$app.Id > C:\temp\update\PID.ini	#create PID entry
$request = Get-Content C:\temp\update\end.ini	#marker entry in program
while ($request -eq 0) {
$request = Get-Content C:\temp\update\end.ini
echo "sleep 10s"
sleep 10
}
#killing app
$appid = Get-Content C:\temp\update\PID.ini
kill $appid
0 > C:\temp\update\end.ini
kill $PID