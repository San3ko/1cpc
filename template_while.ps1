0 > C:\temp\update\end.ini
$request = Get-Content C:\temp\update\end.ini
while ($request -eq 0) {
$request = Get-Content C:\temp\update\end.ini
echo "sleep 10s"
sleep 10
}
echo "done"