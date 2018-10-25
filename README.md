# AWS-Powershell


Sometimes there is no straightforward way to find out which AWS snapshot’s belongs to which instance, especially if it’s not managed properly for a long time. Often, and instance may have been deleted but the snapshots got forgotten. Especially the ones that are created manually.

Goal: Create an excel/csv list of AWS snapshots and linked it to it’s AWS instance and Volume of origin

 

I’ve taken the liberty of putting together a few PowerShell to make this happen, some of this are modification from other contributors
