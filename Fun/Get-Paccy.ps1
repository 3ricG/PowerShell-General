﻿function Get-Paccy {

    $count = 0
    $colors = @('yellow','white','red','green','blue','magenta','cyan')
    $pacarray = @(
    "              ","               ","              ","              ","              ","              ","              ",
    "    ▄███████▄ ","               ","  ▄██████▄    ","  ▄██████▄    ","  ▄██████▄    ","  ▄██████▄    ","  ▄██████▄    ",
    "  ▄█████████▀▀","               ","▄█▀████▀███▄  ","▄██████████▄  ","▄██████████▄  ","▄██████████▄  ","▄███▀████▀█▄  ",
    "  ███████▀    ","  ▄▄  ▄▄  ▄▄   ","█▄▄███▄▄████  ","███ ████ ███  ","███ ████ ███  ","███ ████ ███  ","████▄▄███▄▄█  ",
    "  ███████▄    ","  ▀▀  ▀▀  ▀▀   ","████████████  ","████████████  ","████████████  ","████████████  ","████████████  ",
    "  ▀█████████▄▄","               ","██▀██▀▀██▀██  ","██▀██▀▀██▀██  ","██▀██▀▀██▀██  ","██▀██▀▀██▀██  ","██▀██▀▀██▀██  ",
    "    ▀███████▀ ","               ","▀   ▀  ▀   ▀  ","▀   ▀  ▀   ▀  ","▀   ▀  ▀   ▀  ","▀   ▀  ▀   ▀  ","▀   ▀  ▀   ▀  ",
    "              ","               ","              ","              ","              ","              ","              ",
    "    ▄███████▄ ","               ","  ▄██████▄    ","  ▄██████▄    ","  ▄██████▄    ","  ▄██████▄    ","  ▄██████▄    ",
    "  ▄█████████▀▀","               ","▄█▀████▀███▄  ","▄██ ████ ██▄  ","▄██ ████ ██▄  ","▄██ ████ ██▄  ","▄███▀████▀█▄  ",
    "  ███████▀    ","  ▄▄  ▄▄  ▄▄   ","█▄▄███▄▄████  ","████████████  ","████████████  ","████████████  ","████▄▄███▄▄█  ",
    "  ███████▄    ","  ▀▀  ▀▀  ▀▀   ","████████████  ","████████████  ","████████████  ","████████████  ","████████████  ",
    "  ▀█████████▄▄","               ","██▀██▀▀██▀██  ","██▀██▀▀██▀██  ","██▀██▀▀██▀██  ","██▀██▀▀██▀██  ","██▀██▀▀██▀██  ",
    "   ▀███████▀  ","               ","▀   ▀  ▀   ▀  ","▀   ▀  ▀   ▀  ","▀   ▀  ▀   ▀  ","▀   ▀  ▀   ▀  ","▀   ▀  ▀   ▀  ",
    "              ","               ","              ","              ","              ","              ","              ")

    foreach($piece in $pacarray){
        if($count -eq 6){
            Write-Host -Object $piece -ForegroundColor $colors[$count] -BackgroundColor Black
            $count = 0
        } else {
            Write-Host -Object $piece -ForegroundColor $colors[$count] -BackgroundColor Black -NoNewline
            $count++
        }
    }
}