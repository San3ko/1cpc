#ver 3.0b
#SK scripts
#Tyurin Ivan
#====PARAMETERS
param($task)
$dir = "C:\temp\update"
$wdir = "C:\temp\update\$PID"
#====EXE FILES
$exe1 = "C:\Users\Ivan\Documents\GitHub\PShell\changer\src\changer.exe"
$arg1 = '-dir '+$dir
$exe2 = "C:\Users\Ivan\Documents\GitHub\PShell\changer\src\changer.exe"
$arg2 = '-dir '+$dir
$exe3 = "C:\Users\Ivan\Documents\GitHub\PShell\changer\src\changer.exe"
$arg3 = '-dir '+$dir
#====VAR
	$request = 0
	$marker = 1
	$log_step = 0
#====FUNCTIONS
function check_task {
	if ($task -eq "-1") {
		$exefile = $exe1
		$arguments = $arg1}
	if ($task -eq "-2") {
		$exefile = $exe2
		$arguments = $arg2}
	if ($task -eq "-3") {
		$exefile = $exe2
		$arguments = $arg2}
}
function files_create {
	$checkdir = Test-Path $dir
	$checkwdir = Test-Path $wdir
	if ($checkdir) {} else {
		New-Item $dir -type directory}
	if ($checkwdir) {} else {
		New-Item $wdir -type directory
		New-Item $wdir\pid.ini -type file
		New-Item $wdir\end.ini -type file
		New-Item $wdir\temp.log -type file}
	$check_log = Test-Path $dir\update.log
	$check_l = Test-Path $dir\lastpid.ini
	if ($check_l) {} else {
		New-Item $dir\lastpid.ini -type file}
	if ($check_log) {} else {
		New-Item $dir\update.log -type file}
}
function files_del {
	Remove-Item $wdir -recurse
}
function start_exe {
	0 > $wdir\end.ini
	$PID > $dir\lastpid.ini
	$dir >> $dir\lastpid.ini
	$app = start-process $exefile $arguments -PassThru
	$app.Id > $wdir\PID.ini
	$log_step = 1
	log_entry
}
function wait_marker {
	while ($request -eq 0) {
	$request = Get-Content $wdir\end.ini
	echo "sleep 10s"
	sleep 10			#in seconds. set other if need
	}
	sleep 5				#in seconds. set other if need
}
function kill_exe {
	$appid = Get-Content $wdir\PID.ini
	kill $appid
	$log_step = 2
	log_entry
	files_del
	kill $PID
}
function log_entry {
	$date = date
	switch ($log_step)
	{
		0 {
		"===============">> $wdir\temp.log
		"$date | $PID | Starting script" >> $wdir\temp.log}
		1 {
		"$date | $PID | Starting exe file" >> $wdir\temp.log}
		2 {
		"$date | $PID | Stopping exe by PID" >> $wdir\temp.log
		"APP ID | " + $appid + " | stopped" >> $wdir\temp.log
		$text = Get-Content $wdir\temp.log
		$text >> $dir\update.log		
		}
        default {"The color could not be determined."}
    }
}		
#==================SCRIPT
files_create
log_entry
check_task
start_exe
wait_marker
kill_exe