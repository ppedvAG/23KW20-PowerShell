<#
.SYNOPSIS
 Kurzbeschreibung: Abfrage von Security Events
.DESCRIPTION
 Längere detailiertere Beschreibung: Dieses Skript dient dazu
 Sicherheitsrelevante Events aus dem Eventlog abzufragen
.PARAMETER EventId
 Folgende Werte sind sinnvoll:
 4624
 4625
 4634
.EXAMPLE
Get-eventlog.ps1 -eventid 4625

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
  483530 Apr 08 14:38  FailureA... Microsoft-Windows...         4625 Fehler beim Anmelden eines Kontos....
  479609 Apr 06 09:07  FailureA... Microsoft-Windows...         4625 Fehler beim Anmelden eines Kontos....
  475676 Apr 05 09:42  FailureA... Microsoft-Windows...         4625 Fehler beim Anmelden eines Kontos....
  473559 Apr 04 13:56  FailureA... Microsoft-Windows...         4625 Fehler beim Anmelden eines Kontos....
  472231 Apr 04 11:19  FailureA... Microsoft-Windows...         4625 Fehler beim Anmelden eines Kontos....
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#syntax-for-comment-based-help-in-scripts
#>
[cmdletBinding()]
param(
[string]$Computername = $env:COMPUTERNAME,

[Parameter(Mandatory=$true)]
[int]$eventid,

[int]$Newest = 5
)

Write-Verbose -Message "Vom User wurden folgende Werte angegeben: $Eventid $Computername $Newest"

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventID -eq $eventid | Select-Object -First $Newest


