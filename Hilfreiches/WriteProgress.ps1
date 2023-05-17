1..100 | ForEach-Object -Process
    {
    Write-Progress -Activity "Berechne" -Status "Aufgabe $PSItem" -PercentComplete $PSItem;
    Start-Sleep -Milliseconds 30
    $PSItem #Zurücklegen der Daten in die PipeLine um mit diesen weiter arbeiten zu können
    } | ForEach-Object -Process {$PSItem * 1024}