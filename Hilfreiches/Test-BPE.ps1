

function Test-BPE
{
    param(
    [Parameter(ValueFromPipeLineByPropertyName=$True)]
    [string]$Name
    )

    Begin
    {
        Write-Host -Object "Wird einmal am Anfang ausgeführt" -ForegroundColor Red
    }
    Process
    {
        Write-Host -Object $Name -ForegroundColor (Get-Random -Maximum 15)
    }
    End
    {

        Write-Host -Object "Wird einmal am Anfang ausgeführt" -ForegroundColor Red
    }

}