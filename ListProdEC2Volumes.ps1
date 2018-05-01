$ProfileName = Read-Host "Enter profile name to use"
$Regions = (Get-AWSRegion).Region 
$Volumes = foreach ($Region in $Regions){
    Get-EC2Volume -ProfileName $ProfileName
    }

$VolumeDetailsOutArray = @()
$myobj = @()
foreach ($Volume in $Volumes){

        $myobj = "" | Select "InstanceId","VolumeId","Size","SnapshotId","Name"
        #Fill the object with the values mentioned above
        $myobj.VolumeId = $Volume.VolumeId
        $myobj.InstanceId = $Volume.Attachments.InstanceId
        $myobj.Size = $Volume.Size
        $myobj.SnapshotId = $Volume.SnapshotId
        $myobj.Name = ($Volume.Tags | ? {$_.Key -EQ "Name"}).Value | Out-String -Stream
        
        #Add the objects to the Volume Out Arrays
        $VolumeDetailsOutArray += $myobj

        #Wipe the temp object just to be sure
        $myobj = $null
    }


#$VolumeDetailsOutArray | Out-GridView
$VolumeDetailsOutArray | Export-Csv C:\Temp\Prod-EC2Volumes.csv -Encoding ascii -NoTypeInformation
