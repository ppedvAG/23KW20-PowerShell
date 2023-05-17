
class Fahrzeug
{
    [int]$Sitzplätze
    [Farbe]$Farbe
    [string]$Hersteller

}

class Auto : Fahrzeug
{
    [int]$Räder

    Auto()
    {

    }

    Auto([string]$Hersteller)
    {
        $this.Hersteller = $Hersteller
    }

    [string]ToString()
    {
        [string]$Ausgabe = $this.Hersteller + " /\ " + $this.Farbe
        return $Ausgabe
    }

    [void]fahre([int]$Strecke)
    {
        for($i = 1; $i -le $Strecke; $i++)
        {
            Start-Sleep -Milliseconds 50
            $Straße += " - "
            Clear-Host
            Write-Host -Object ($Straße + "🚗")
        }
    }
}

enum Farbe
{
    Silber
    Blau
    Grün
    Gelb
    Schwarz
    Lila = 99
}

$BMW = [Auto]::new("BMW")
$BMW.Farbe = [Farbe]::Grün
$BMW.Räder = 4
$BMW.Sitzplätze = 5