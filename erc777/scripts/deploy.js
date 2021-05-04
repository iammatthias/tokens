// scripts/deploy.js

const { tokenName, tokenSymbol } = require('./../secrets.json');

async function main() {
  const Token = await ethers.getContractFactory(tokenName);
  console.log('Deploying ' + tokenName + '...');
  const token = await upgrades.deployProxy(
    Token,
    [tokenName, tokenSymbol, []],
    {
      initializer: 'initialize',
    }
  );
  console.log(tokenName + ' deployed to:', token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
