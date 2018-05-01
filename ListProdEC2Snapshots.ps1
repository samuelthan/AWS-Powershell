$ProfileName = Read-Host "Enter profile name to use"
$AWSAccountNumber = Read-Host "Enter AWS Account Number"
#Get-EC2Snapshot -ProfileName $ProfileName -OwnerId $AWSAccountNumber  | Select-Object SnapshotId, VolumeId, VolumeSize, StartTime, OwnerId, Description | Out-GridView
Get-EC2Snapshot -ProfileName $ProfileName -OwnerId $AWSAccountNumber | Select-Object SnapshotId, VolumeId, VolumeSize, StartTime, OwnerId, Description |  Export-CSV -Path C:\Temp\Prod-EC2SnapShots.csv -Encoding ascii -NoTypeInformation