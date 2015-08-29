[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true)]
    [string] $URL,
    [ValidateSet("GetUrls","GetImages")]
    [string] $Action = "GetUrls"
)

$objWebClient = New-Object -TypeName System.Net.WebClient
$arrContent = $objWebClient.DownloadString($URL) -split "`n"

switch($Action) {

    "GetUrls" {

        $arrUrls = @()

        foreach($line in $arrContent) {
        
            if( $line -match '.*<a\shref="(.*"\s*>)(.*</a>|\s*/\s*>\s*)' ) {

                $strBaseUrl = $Matches[1] -replace '">$'
                if($strBaseUrl -notmatch "^http|^https|^www|^\w+\.") {

                    $strFullURL = "$($URL)/$($strBaseUrl)"

                } else {

                    $strFullURL = $strBaseUrl

                }

                $arrUrls += $strFullURL

            }

        }

    }

}

$arrUrls
