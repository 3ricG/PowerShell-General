param(
   $Throttle = 255, #threads
   $OctetStart = "192.168.1",
   [ValidateSet(“ogv”,"obj")] 
   $Output = "ogv"
)
 
$ScriptBlock = {
   Param (
      [string]$OctetStart,
      [string]$IPNum
   )

   function fastping{
      [CmdletBinding()]
      param(
      [String]$computername = "127.0.0.1",
      [int]$delay = 100
      )

      $ping = new-object System.Net.NetworkInformation.Ping
      # see http://msdn.microsoft.com/en-us/library/system.net.networkinformation.ipstatus%28v=vs.110%29.aspx
      try {
        if ($ping.send($computername,$delay).status -ne "Success") {
          return $false;
        }
        else {
          return $true;
        }
      } catch {
        return $false;
      }
    }

   $IP = $OctetStart + "." + $IPNum
   $RunResult = New-Object PSObject -Property @{
      Ping = $( fastping -computername $IP )
      IP = $IP
   }
   Return $RunResult
}
 
$RunspacePool = [RunspaceFactory]::CreateRunspacePool(1, $Throttle)
$RunspacePool.Open()
$Jobs = @()
 
1..255 | % {
   $Job = [powershell]::Create().AddScript($ScriptBlock).AddArgument($OctetStart)
   $Job.AddArgument($_) | Out-Null
   $Job.RunspacePool = $RunspacePool
   $Jobs += New-Object PSObject -Property @{
      RunNum = $_
      Pipe = $Job
      Result = $Job.BeginInvoke()
   }
}
 
Write-Host "Waiting.." -NoNewline
Do {
   Write-Host "." -NoNewline
   Start-Sleep -Seconds 1
} While ( $Jobs.Result.IsCompleted -contains $false)
Write-Host "All jobs completed!"
 
$Results = @()
ForEach ($Job in $Jobs)
{   $Results += $Job.Pipe.EndInvoke($Job.Result)
}
 
if($Output -eq "ogv") {
    
    $Results | Out-GridView

} else {

    $Results

}