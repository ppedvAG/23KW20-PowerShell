[cmdletBinding()]
param(
[ValidateScript({Test-Path -Path $PSItem -PathType Container})]
[Parameter(Mandatory=$true)]
[string]$Path,

[ValidateRange(0,99)]
[int]$DirCount = 5,

[ValidateRange(1,99)]
[int]$FileCount = 9,

[ValidateLength(2,20)]
[string]$Name = "TestFiles2",

[switch]$Force
)
# Funktionen
function New-TestFiles
{
[cmdletBinding()]
param(
[ValidateScript({Test-Path -Path $PSItem -PathType Container})]
[Parameter(Mandatory=$true)]
[string]$Path,

[ValidateRange(1,99)]
[int]$FileCount = 9,

[ValidateLength(2,20)]
[string]$Name = "File"

)
for($i = 1; $i -le $FileCount; $i ++)
{
    $filenumber = "{0:D2}" -f $i
    $filename = $Name + $filenumber + ".txt"

    New-Item -Path $Path -Name $filename -ItemType File
}


}

##FunktionEnde


if($Path.EndsWith("\") -ne $true)
{
    $Path += "\"
}
$TestDirPath = $Path + $Name

if(Test-Path -Path $TestDirPath -PathType Container)
{
    if($Force)
    {
        Remove-Item -Path $TestDirPath -Force -Recurse
    }
    else
    {#ToDo Fehlerbehandlung
        Write-Host -Object "Ordner bereits vorhanden"
        exit
    }
}

$TestFilesDir = New-Item -Path $Path -Name $Name -ItemType Directory

Write-Debug -Message "Vor erster Datei erstellung"

New-TestFiles -Path $TestFilesDir.FullName -FileCount $FileCount 
<#Ersetzt durch Funktionsaufruf
for($i = 1; $i -le $FileCount; $i ++)
{
    $filenumber = "{0:D2}" -f $i
    $filename = "File" + $filenumber + ".txt"

    New-Item -Path $TestFilesDir.FullName -Name $filename -ItemType File
}#>

for($i = 1; $i -le $DirCount; $i++)
{
    $DirNumber =  "{0:D2}" -f $i
    $DirName = "Dir" + $DirNumber

    $subdir = New-Item -Path $TestFilesDir.FullName -Name $DirName -ItemType Directory
    New-TestFiles -Path $subdir.FullName -FileCount $FileCount -Name ($DirName + "-File")
    <# Ersetzt durch Funktionsaufruf
    for($j = 1; $j -le $FileCount; $j++)
    {
        $filenumber = "{0:D2}" -f $j
        $filename = "File" + $filenumber + ".txt"

        New-Item -Path $Subdir.FullName -Name $filename -ItemType File
    }#>
}