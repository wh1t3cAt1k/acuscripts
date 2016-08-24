param ([string] $checkoutBranchName)

defineconstants

cd $repositoryPath

# Clean everything, checkout the required branch
# -
git clean -xfd -e $webConfigPath
git reset --hard
git checkout $checkoutBranchName
if ($pull) { git pull }

Write-Host "Checked out $checkoutBranchName and cleaned the binaries." -ForegroundColor Green
