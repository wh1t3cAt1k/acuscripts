param(
    [string][Alias("b", "branch")] $checkoutBranchName = ".",
    [switch][Alias("P")] $pull,
    [switch][Alias("N")] $noBuild)

if ($pull)
{
    git fetch
}

# Check that the branch exists
# -
git rev-parse --verify $checkoutBranchName

if (-not $?)
{
    Write-Host "Branch $checkoutBranchName does not exist locally." -ForegroundColor Red
    Exit(1)
}

defineconstants
killvisualstudio
resetcheckoutclean $checkoutBranchName
restorenugetpackages

# Package restore for NetTools and Pure solutions
# -
cd $repositoryPath

# Build the tools and pure
# -
if (!$noBuild)
{
    .\build_pure_and_net_tools.cmd
    Write-Host "NetTools and Pure solutions build completed." -ForegroundColor Green
}
else
{
    Write-Host "Build process skipped." -ForegroundColor Green
}

runvs pure