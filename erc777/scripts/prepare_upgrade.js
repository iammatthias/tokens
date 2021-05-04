const { proxy, tokenName } = require('./secrets.json');

async function main() {
  const proxyAddress = { proxy };

  const Token = await ethers.getContractFactory(tokenName);
  console.log('Preparing upgrade...');
  const tokenAddress = await upgrades.prepareUpgrade(proxyAddress, Token);
  console.log('Token at:', tokenAddress);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
