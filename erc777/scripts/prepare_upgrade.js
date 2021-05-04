const { proxy } = require('./secrets.json');

async function main() {
  const proxyAddress = { proxy };

  const TestToken = await ethers.getContractFactory('TestToken');
  console.log('Preparing upgrade...');
  const testTokenAddress = await upgrades.prepareUpgrade(
    proxyAddress,
    TestToken
  );
  console.log('TestToken at:', testTokenAddress);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
