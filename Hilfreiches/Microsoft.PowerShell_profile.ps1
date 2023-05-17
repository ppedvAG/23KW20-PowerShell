function prompt 
{
    "PS [$((Get-Date).ToShortTimeString())]> "
}

function Get-Mot
{
    Invoke-RestMethod -Uri "http://numbersapi.com/random"
}
Get-Mot
