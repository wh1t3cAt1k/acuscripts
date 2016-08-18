param(
    [string][Alias("s", "serv")] 
    $server = "localhost",
    [string][Alias("database", "dbname")] 
    $db = "5_3X",
    [string][Alias("u", "username")] 
    $uid = "root",
    [string][Alias("p", "pass", "password")] 
    $pwd = "123")

defineconstants

# Prepare the web config with the required DB name
# -
Remove-Item $webConfigPath -ErrorAction SilentlyContinue

Copy-Item ($webConfigDirectory + "Web.config_") $webConfigPath

(Get-Content $webConfigPath) `
    -replace "(Initial Catalog|Database)=.*?;", ('$1='+"$db;") `
    -replace "(Data Source|Server)=.*?;", ('$1='+"$server;") `
    -replace "(User id|Uid)=.*?;", ('$1='+"$uid;") `
    -replace "(password|Pwd)=.*?;", ('$1='+"$pwd;") `
    | Set-Content $webConfigPath

Write-Host "Web.config copied with server '$server' and database name '$db'." -ForegroundColor Green