$dir = "C:\temp\update"
$checkdir = Test-Path $dir
$check1 = Test-Path $dir\pid.ini
$check2 = Test-Path $dir\update.log
$check3 = Test-Path $dir\end.ini
echo "$check1 $check2 $check3"
if ($checkdir) {} else {echo "creating dir"
	New-Item $dir -type directory}
if ($check1) {} else {echo "creating file"
	New-Item $dir\pid.ini -type file}
if ($check2) {} else {echo "creating file"
	New-Item $dir\update.log -type file}
if ($check3) {} else {echo "creating file"
	New-Item $dir\end.ini -type file}
echo "$check1 $check2 $check3"