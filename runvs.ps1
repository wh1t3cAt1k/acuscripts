param([string] $solutionName="pure")

defineconstants

$pathDictionary = @{}
$pathDictionary.Add("pure", "WebSites\Pure\Pure.sln")
$pathDictionary.Add("nettools", "NetTools\NetTools.sln")
$pathDictionary.Add("purewithnettools", "PureWithNetTools.sln")

$solutionPath = $repositoryPath + $pathDictionary[$solutionName];

Write-Host "Running Visual Studio..." -ForegroundColor Green

Start-Process devenv $solutionPath -Verb runAs