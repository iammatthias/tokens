// scripts/deploy.js
async function main() {
  const TestToken = await ethers.getContractFactory('TestToken');
  console.log('Deploying TestToken...');
  const testToken = await upgrades.deployProxy(
    TestToken,
    ['TestToken', 'TestToken', []],
    {
      initializer: 'initialize',
    }
  );
  console.log('TestToken deployed to:', testToken.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
