# assignment3
The provided code in as3.sol is a Solidity smart contract for an ERC-721 token (Non-Fungible Token) called `UniqueAsset`, which allows you to mint unique assets. It also includes a JavaScript script for uploading files to the IPFS (InterPlanetary File System) using the Pinata API. Let's break down the code step by step:

1. **Solidity Smart Contract** (`UniqueAsset.sol`):
   - The contract specifies a Solidity version (`^0.8.17`) and imports the necessary dependencies from OpenZeppelin, which provides standardized and secure implementations of smart contracts.

   - The contract `UniqueAsset` inherits from the `ERC721` contract, making it an ERC-721 token.

   - The `Counters` library from OpenZeppelin is used to manage token IDs.

   - A mapping called `hashes` is declared to keep track of used hashes. This is used to ensure that each asset is indeed unique.

   - In the constructor, the ERC721 contract is initialized with the name "UniqueAsset" and symbol "UNA."

   - The `awardItem` function allows you to mint a new token and associate it with a recipient's address. It takes three parameters:
     - `recipient`: The address that will receive the minted NFT.
     - `hash`: A unique identifier for the NFT.
     - `metadata`: A string URI pointing to metadata associated with the NFT.

   - Within the `awardItem` function:
     - It checks whether the provided `hash` is not already used.
     - Marks the `hash` as used.
     - Increments the token ID.
     - Mints a new NFT with the recipient's address and assigns it the current token ID.
     - Sets the token URI for the newly minted NFT.

2. **JavaScript Deployment Script** (`deploy.js`):
   - It deploys the `UniqueAsset` smart contract using the Truffle framework (via `artifacts.require` and `deployer.deploy`).

3. **Uploading Files to IPFS Script** (`uploadToIPFS.js`):
   - This script uploads a file to IPFS using the Pinata API. It uses the `axios` library for making HTTP requests and `form-data` for handling multipart/form-data.

   - The Pinata API requires an API key and secret key. These should be filled in with your actual API keys.

   - The script creates a new `FormData` object and appends the file to it.

   - It sends a POST request to the Pinata API's `pinFileToIPFS` endpoint with the file data and your API keys in the headers.

   - The response data, which includes the IPFS hash of the uploaded file, is logged to the console.

To use this code, you would typically do the following:

1. Deploy the `UniqueAsset` contract using Truffle or a similar development framework.
2. Configure the Pinata API keys.
3. Run the `pinFileToIPFS` function to upload your files to IPFS.
4. After uploading, you can call the `awardItem` function in the smart contract to mint NFTs, providing the IPFS hash and associated metadata URI.

Remember to customize the API keys, file paths, and other parameters to suit your specific use case.

TEST DESCRIPTION
These tests cover the following aspects:

1.Deployment of the contract with the correct name and symbol.
2.Minting a new NFT with unique metadata and ensuring the token ID is greater than 0.
3.Preventing the minting of an NFT with a duplicate hash.
4.Verifying that the token URI is set correctly for minted NFTs.
