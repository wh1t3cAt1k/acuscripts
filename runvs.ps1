param([string] $solutionName="pure")

$repositoryPath = "c:\repos\code\"

$pathDictionary = @{}
$pathDictionary.Add("pure", "WebSites\Pure\Pure.sln")
$pathDictionary.Add("nettools", "NetTools\NetTools.sln")
$pathDictionary.Add("purewithnettools", "PureWithNetTools.sln")

$solutionPath = $repositoryPath + $pathDictionary[$solutionName];

Start-Process devenv $solutionPath -Verb runAs