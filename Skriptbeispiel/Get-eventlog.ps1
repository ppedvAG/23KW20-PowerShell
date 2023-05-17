[cmdletBinding()]
param(
[string]$Computername = $env:COMPUTERNAME,

[Parameter(Mandatory=$true)]
[int]$eventid,

[int]$Newest = 5
)

Write-Verbose -Message "Vom User wurden folgende Werte angegeben: $Eventid $Computername $Newest"

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventID -eq $eventid | Select-Object -First $Newest


