function Kill-With-Mercy
{
    param([string] $processName, [int] $gracePeriod = 5)
    $processHandle = Get-Process $processName -ErrorAction SilentlyContinue

    if ($processHandle)
    {
        # Try close process gracefully first
        # -
        $processHandle.CloseMainWindow()

        # Kill after mercy has ended
        # -
        Sleep $gracePeriod
        
        if (!$processHandle.HasExited)
        {
            $processHandle | kill -Force
        }
    }
}

# Remove all processes that could prevent cleaning
# -
Kill-With-Mercy devenv
Kill-With-Mercy MSBuild

Write-Host "Stopped all Visual Studio and MSBuild processes." -ForegroundColor Green