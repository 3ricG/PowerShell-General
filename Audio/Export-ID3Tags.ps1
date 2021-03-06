[CmdletBinding()]
param(
    [String] $Path,
    [ValidateSet("OBJ","CSV","XML")]
    [String] $OutputType="OBJ",
    [String] $OutputPath
)

begin {

    #Set $PSScriptRoot if running PSv2 or lower
    if($PSVersionTable.PSVersion.Major -lt 3){

        $PSScriptRoot = split-path -parent $MyInvocation.MyCommand.Definition

    }

    if($OutputType -ne "OBJ"){
    
        if(!$OutputPath){
            
            throw "Must include -OutputPath"
            
        }
    
    }

    #Using taglib from http://download.banshee.fm/taglib-sharp/
    [system.reflection.assembly]::loadfile("$PSScriptRoot\lib\taglib-sharp.dll") | Out-Null

    #Create array to hold tag objects
    $Tags = New-Object System.Collections.ArrayList
    
}

process {

    foreach($Track in $(Get-ChildItem -Path $Path -Recurse)){

        $Tags.Add([taglib.file]::Create($Track.fullname).Tag) | Out-Null

    }

}

end {

    switch($OutputType){
    
        "OBJ" { $Tags }
        "CSV" { $Tags | Export-Csv -Path $OutputPath -NoTypeInformation }
        "XML" { $Tags | Export-Clixml -Path $OutputPath }
    
    }
    
}