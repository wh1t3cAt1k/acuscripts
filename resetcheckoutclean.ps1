param ([string] $checkoutBranchName)

defineconstants

cd $repositoryPath

# Clean everything, checkout the required branch
# -
git clean -xfd
git reset --hard
git checkout $checkoutBranchName
if ($pull) { git pull }

echo "Checked out $checkoutBranchName and cleaned the binaries"
