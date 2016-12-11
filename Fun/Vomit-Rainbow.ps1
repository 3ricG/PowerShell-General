Function Vomit-Rainbow {
    param(
        $StringVal="BLAH",
        [switch]$Seizure
    )

    if($Seizure) {
        $StringVal = @("`n"*100)
    }

    while($true) {
        Write-Host -Fore $(Get-Random -Min 0 -Max 15) -Back $(Get-Random -Min 0 -Max 15) "$StringVal" -NoNewline
    }
}