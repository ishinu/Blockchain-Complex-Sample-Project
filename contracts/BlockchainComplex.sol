// SPDX-License-Identifier:MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BlockchainComplex is ERC721URIStorage, Ownable{
    using Counters for Counters.Counter;
    Counters.Counter private _id;
    uint private flatNumber;
    mapping(address=>mapping(uint=>Buyer)) public orderBook;

    struct Buyer{
        string name;
        uint contact;
        string flatAddress;
        uint dob;
        uint amount;
    }

    constructor() ERC721("Blockchain-Complex","BCMPLX"){}

    function mintNFT(address _recipient, string memory _contractURI) private returns(uint256){
        _id.increment();
        uint256 newItemId = _id.current();
        _mint(_recipient, newItemId);
        _setTokenURI(newItemId, _contractURI);
        flatNumber = _id.current();
        return newItemId;
    }

    function flatDetails(string memory _contractURI,string memory _name, uint _contact, string memory _flatAddress, uint _dob, uint _amount) public onlyOwner{
        mintNFT(msg.sender, _contractURI);
        orderBook[msg.sender][_id.current()] = Buyer(_name,_contact,_flatAddress,_dob,_amount);
    }

}
