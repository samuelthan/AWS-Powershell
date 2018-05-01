
$ProfileName = Read-Host "Enter profile name to use"
$Instances = (Get-EC2Instance -ProfileName $ProfileName).instances
$VPCS = Get-EC2Vpc -ProfileName $ProfileName
$Output = foreach ($VPC in $VPCS) {
$Instances | Where-Object {$_.VpcId -eq $VPC.VpcId} | foreach {
New-Object -TypeName PSObject -Property @{
            ‘InstanceId’ = $_.InstanceId          
            ‘InstanceName’ = ($_.Tags | Where-Object {$_.Key -eq ‘Name’}).Value
            ‘LaunchTime’ = $_.LaunchTime
        }
    }
}


#$Output | Select-Object InstanceId, InstanceName, LaunchTime | Out-GridView
$Output | Select-Object InstanceId, InstanceName, LaunchTime | Export-CSV -Path C:\Temp\Prod-EC2Instances.csv -Encoding ascii -NoTypeInformation