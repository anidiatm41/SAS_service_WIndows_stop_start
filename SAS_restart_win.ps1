

# === Set Sleep Length (in Seconds) ===
$Sleep= 5

# === Print Date and Time ===
(Get-Date).DateTime
Write-Output "`n"

# === Stop Dependent Services ===
Stop-Service -name "*SASServer13_1 - WebAppServer" -Force
Stop-Service -name "*SASServer12_1 - WebAppServe*" -Force
Stop-Service -name "*SASServer11_1 - WebAppServer*" -Force
Stop-Service -name "*SASServer2_1 - WebAppServer*" -Force
Stop-Service -name "*SASServer1_1 - WebAppServer*" -Force
Stop-Service -name "*httpd-WebServer*" -Force
Stop-Service -name "*JMS Broker on port 61616*" -Force
Stop-Service -name "*Cache Locator on port 41415*" -Force
Stop-Service -name "*Web Infrastructure Platform Data Server*" -Force
Stop-Service -name "*dfx-POServer-server1*" -Force
Stop-Service -name "*SAS Environment Manager Agent*" -Force
Stop-Service -name "*SAS Environment Manager*" -Force 
Stop-Service -name "*JobMonitorDataServer*" -Force
Stop-Service -name "*Deployment Tester Server*" -Force
Stop-Service -name "*DataRemediationDataServer*" -Force
Stop-Service -name "*Information Retrieval Studio*" -Force
Stop-Service -name "*Connect Spawner*" -Force
Stop-Service -name "*SASApp - OLAP Server*" -Force
Stop-Service -name "*SASSimulationStudioSpawner*" -Force
Stop-Service -name "*SAS Deployment Agent*" -Force
Stop-Service -name "*Object Spawner*" -Force
Stop-Service -name "*SASMeta - Metadata Server*" -Force


# === Sleep for X Seconds ====
Start-Sleep -Seconds $Sleep

# === List status of SAS Services (all should be stopped) ====
Write-Output "----------------+"
Write-Output "Stopped Services:"
Write-Output "----------------+"
Get-Service -name "*httpd-WebServer*","*JMS Broker on port 61616*","*Cache Locator on port 41415*","*Web Infrastructure Platform Data Server*","*dfx-POServer-server1*","*SAS Environment Manager Agent*","*SAS Environment Manager*" ,"*JobMonitorDataServer*","*Deployment Tester Server*","*DataRemediationDataServer*","*Information Retrieval Studio*","*Connect Spawner*","* OLAP Server*","*SASSimulationStudioSpawner*","*SAS Deployment Agent*","*Object Spawner*","*SASMeta - Metadata Server*" | Format-Table -AutoSize

# === Start Metadata Server ===
Start-Service -name "*SASMeta - Metadata Server"
Start-Service -name "*Web Infrastructure Platform Data Server*"
Start-Service -name "*SASApp - OLAP Server*"
Start-Service -name "*Object Spawner*"
Start-Service -name "*Connect Spawner*"
Start-Service -name "*DataRemediationDataServer*"
Start-Service -name "*Information Retrieval Studio*"
Start-Service -name "*Cache Locator on port 41415*"
Start-Service -name "*JMS Broker on port 61616*"
Start-Service -name "*httpd-WebServer*"
Start-Service -name "*SASServer1_1 - WebAppServer*"
Start-Sleep -Seconds $Sleep
Start-Service -name "*SASServer2_1 - WebAppServer*"
Start-Sleep -Seconds $Sleep
Start-Service -name "*SASServer11_1 - WebAppServer*"
Start-Sleep -Seconds $Sleep
Start-Service -name "*SASServer12_1 - WebAppServer*"
Start-Sleep -Seconds $Sleep
Start-Service -name "*SASServer13_1 - WebAppServer*"
Start-Sleep -Seconds $Sleep
Start-Service -name "*SAS Environment Manager*"
Start-Service -name "*SAS Environment Manager Agent*"
Start-Service -name "*dfx-POServer-server1*"
Start-Service -name "*SASSimulationStudioSpawner*"
Start-Service -name "*SAS Deployment Agent*"
Start-Service -name "*JobMonitorDataServer*"

#Start-Service -name "*Deployment Tester Server*"


# === Sleep for X Seconds ====
Start-Sleep -Seconds $Sleep

# === List status of SAS Services (all should be started) ====
Write-Output "----------------+"
Write-Output "Started Services:"
Write-Output "----------------+"
Get-Service -name "*httpd-WebServer*","*JMS Broker on port 61616*","*Cache Locator on port 41415*","*Web Infrastructure Platform Data Server*","*dfx-POServer-server1*","*SAS Environment Manager Agent*","*SAS Environment Manager*" ,"*JobMonitorDataServer*","*Deployment Tester Server*","*DataRemediationDataServer*","*Information Retrieval Studio*","*Connect Spawner*","* OLAP Server*","*SASSimulationStudioSpawner*","*SAS Deployment Agent*","*Object Spawner*","*SASMeta - Metadata Server*" | Format-Table -AutoSize

# === Test that all services are running ===
$stopped=Get-Service -name "*httpd-WebServer*","*JMS Broker on port 61616*","*Cache Locator on port 41415*","*Web Infrastructure Platform Data Server*","*dfx-POServer-server1*","*SAS Environment Manager Agent*","*SAS Environment Manager*" ,"*JobMonitorDataServer*","*Deployment Tester Server*","*DataRemediationDataServer*","*DIPJobRunner*","*Information Retrieval Studio*","*Connect Spawner*","* OLAP Server*","*SASSimulationStudioSpawner*","*SAS Deployment Agent*","*Object Spawner*","*SASMeta - Metadata Server*" | Where {$_.Status -ne "Running"}
if ($stopped -ne $null) {
   Write-Output "ERROR: The below SAS Services are not running:`n"
   $stopped | Format-Table -AutoSize
}

# === Print Date and Time ===
(Get-Date).DateTime


Start-Sleep -Seconds 30

exit
