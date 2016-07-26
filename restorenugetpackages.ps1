# Package restore for NetTools and Pure solutions
# -
defineconstants

cd $repositoryPath

nuget restore $netToolsSolutionPath -NonInteractive -NoCache -ConfigFile ($repositoryPath + "NuGet.config")
nuget restore $pureSolutionPath -NonInteractive -NoCache -ConfigFile ($repositoryPath + "NuGet.config")

Write-Host "NuGet packages restored" -ForegroundColor Green