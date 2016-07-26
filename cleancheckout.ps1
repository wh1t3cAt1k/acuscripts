param(
    [string] $checkoutBranchName = ".",
    [string] $databaseName = "5_3X",
    [switch] $pull,
    [switch] $nobuild)

defineconstants
killvisualstudio
resetcheckoutclean $checkoutBranchName
createwebconfig $databaseName
restorenugetpackages

# Package restore for NetTools and Pure solutions
# -
cd $repositoryPath

# Build the tools and pure
# -
if (!$nobuild)
{
    .\build_pure_and_net_tools.cmd
    Write-Host "NetTools and Pure solutions build completed." -ForegroundColor Green
}
else
{
    Write-Host "Build process skipped." -ForegroundColor Green
}

runvs pure