param([string] $databaseName = "5_3X")

defineconstants

# Prepare the web config with the required DB name
# -
Remove-Item $webConfigPath -ErrorAction SilentlyContinue
Copy-Item ($webConfigDirectory + "Web.config_") $webConfigPath
(Get-Content $webConfigPath) -replace "=debug50_3", "=$databaseName" | Set-Content $webConfigPath

Write-Host "Web.config copied with database name $databaseName." -ForegroundColor Green