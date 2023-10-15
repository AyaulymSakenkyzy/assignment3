pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
contract UniqueAsset is ERC721 {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  mapping(string => uint8) hashes;
  constructor() public ERC721("UniqueAsset", "UNA") {}
}
function awardItem(address recipient, string memory hash, string memory metadata)
  public
  returns (uint256){  require(hashes[hash] != 1);  
  hashes[hash] = 1;  
  _tokenIds.increment();  
  uint256 newItemId = _tokenIds.current();  
  _mint(recipient, newItemId);  
  _setTokenURI(newItemId, metadata);  
  return newItemId;
}
var UniqueAsset = artifacts.require("UniqueAsset");
module.exports = function(deployer) {
  deployer.deploy(UniqueAsset);
};

const pinataApiKey = "YOURAPIKEY";
const pinataSecretApiKey = "YOURSECRETKEY";
const axios = require("axios");
const fs = require("fs");
const FormData = require("form-data");
const pinFileToIPFS = async () => {  const url = `https://api.pinata.cloud/pinning/pinFileToIPFS`;=  let data = new FormData();  
data.append("file", fs.createReadStream("./pathtoyourfile.png"));  
const res = await axios.post(url, data, {
    maxContentLength: "Infinity", 
    headers: {
      "Content-Type": `multipart/form-data; boundary=${data._boundary}`
      pinata_api_key: pinataApiKey, 
      pinata_secret_api_key: pinataSecretApiKey,
    },
  });  
  console.log(res.data);
};
pinFileToIPFS();

