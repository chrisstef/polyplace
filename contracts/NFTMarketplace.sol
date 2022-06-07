// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4; // set version to match with waht we have in our hardhat configuration

// Using ERC721 standard
// Functionality we can use
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

// public means available from the client application
// view means it's not doing any transaction work

// Creating our contract ->Inherited from ERC721URIStorage
contract NFTMarketplace is ERC721URIStorage {
    // allows us to use the coutner utility.
    using Counters for Counters.Counter;
    // when the first token is minted it'll get a value of zero, the second one is one
    // and then using counters this we'll increment token ids
    Counters.Counter private _tokenIds;
    Counters.Counter private _itemsSold;

    // fee to list an nft on the marketplace
    // charge a listing fee.
    uint256 listingPrice = 0.025 ether;

    // declaring the owner of the contract
    // owner earns a commision on every item sold
    address payable owner;

    // keeping up with all the items that have been created
    // pass in the integer which is the item id and it returns a market item.
    // to fetch a market item, we only need the item id
    mapping(uint256 => MarketItem) private idToMarketItem;

    struct MarketItem {
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    // have an event for when a market item is created.
    // this event matches the MarketItem
    event MarketItemCreated(
        uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool sold
    );

    // set the owner as the msg.sender
    // the owner of the contract is the one deploying it
    constructor() ERC721("MarketPlace Tokens", "MAT") {
      owner = payable(msg.sender);
    }

    /* Updates the listing price of the contract */
    function updateListingPrice(uint256 _listingPrice) public payable {
        require(
            owner == msg.sender,
            "Only marketplace owner can update listing price."
        );
        listingPrice = _listingPrice;
    }

    /* Returns the listing price of the contract */
    // when we deploy the contract, on the frontend we don't know how much to list it for
    // so we call the contract and get the listing price and make sure we're sending the right amount of payment
    function getListingPrice() public view returns (uint256) {
        return listingPrice;
    }

    /* Mints a token and lists it in the marketplace */
    function createToken(string memory tokenURI, uint256 price)
        public
        payable
        returns (uint256)
    {
        _tokenIds.increment();
        // create a variable that get's the current value of the tokenIds (0, 1, 2...)
        uint256 newTokenId = _tokenIds.current();
        // mint the token
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        createMarketItem(newTokenId, price);
        // we've just minted the token and made it sellable
        // now we can return the id to the client side so we can work with it
        return newTokenId;
    }

    function createMarketItem(uint256 tokenId, uint256 price) private {
        // require a certain CONDITION, in this case price greater than 0
        require(price > 0, "Price must be at least 1 wei.");
        // require that the users sending in the transaction is sending in the correct amount
        require(
            msg.value == listingPrice,
            "Price must be equal to listing price."
        );

        // create the mapping for the market items
        // payable(address(0)) is the owner.
        // currently there's no owner as the seller is putting it to market so it's an empty address
        // last value  is boolean for sold, its false because we just put it so it's not sold yet
        // this is creating the first market item
        idToMarketItem[tokenId] = MarketItem(
            tokenId,
            payable(msg.sender),
            payable(address(this)),
            price,
            false
        );

        // we now want to transfer the ownership of the nft to the contract -> next buyer
        // method available on IERC721
        _transfer(msg.sender, address(this), tokenId);
        emit MarketItemCreated(
            tokenId,
            msg.sender,
            address(this),
            price,
            false
        );
    }

    /* allows someone to resell a token they have purchased */
    function resellToken(uint256 tokenId, uint256 price) public payable {
        require(
            idToMarketItem[tokenId].owner == msg.sender,
            "Only item owner can perform this operation."
        );
        require(
            msg.value == listingPrice,
            "Price must be equal to listing price."
        );
        idToMarketItem[tokenId].sold = false;
        idToMarketItem[tokenId].price = price;
        idToMarketItem[tokenId].seller = payable(msg.sender);
        idToMarketItem[tokenId].owner = payable(address(this));
        _itemsSold.decrement();

        _transfer(msg.sender, address(this), tokenId);
    }

    /* Creates the sale of a marketplace item */
    /* Transfers ownership of the item, as well as funds between parties */
    function createMarketSale(uint256 tokenId) public payable {
        uint256 price = idToMarketItem[tokenId].price;
        require(
            msg.value == price,
            "Please submit the asking price in order to complete the purchase."
        );
        idToMarketItem[tokenId].owner = payable(msg.sender);
        idToMarketItem[tokenId].sold = true;
        idToMarketItem[tokenId].seller = payable(address(0));
        _itemsSold.increment();

        // next, we want to transfer the NFT ownership from the seller to the buyer
        _transfer(address(this), msg.sender, tokenId);
        payable(owner).transfer(listingPrice);
        payable(idToMarketItem[tokenId].seller).transfer(msg.value);
    }

    /* Returns all unsold market items */
    function fetchMarketItems() public view returns (MarketItem[] memory) {
        uint256 itemCount = _tokenIds.current();
        uint256 unsoldItemCount = _tokenIds.current() - _itemsSold.current();
        uint256 currentIndex = 0;

        // looping over the number of items created and incremnet htat number if we have an empty address

        // empty array called items
        // the type of the element in the array is marketitem, and the unsolditemcount is the lenght
        MarketItem[] memory items = new MarketItem[](unsoldItemCount);
        for (uint256 i = 0; i < itemCount; i++) {
            // check to see if the item is unsold -> checking if the owner is an empty address -> then it's unsold
            // above, where we were creating a new market item, we were setting the address to be an empty address
            // the address get's populated if the item is sold
            if (idToMarketItem[i + 1].owner == address(this)) {
                // the id of the item that we're currently interracting with
                uint256 currentId = i + 1;
                // get the mapping of the idtomarketitem with the -> gives us the reference to the marketitem
                MarketItem storage currentItem = idToMarketItem[currentId];
                // insert the market item to the items array
                items[currentIndex] = currentItem;
                // increment the current index
                currentIndex += 1;
            }
        }

        return items;
    }

    /* Returns only items that a user has purchased */
    function fetchMyNFTs() public view returns (MarketItem[] memory) {
        uint256 totalItemCount = _tokenIds.current();
        uint256 itemCount = 0;
        uint256 currentIndex = 0;

        // gives us the number of items that we own
        for (uint256 i = 0; i < totalItemCount; i++) {
            // check if nft is mine
            if (idToMarketItem[i + 1].owner == msg.sender) {
                itemCount += 1;
            }
        }

        MarketItem[] memory items = new MarketItem[](itemCount);
        for (uint256 i = 0; i < totalItemCount; i++) {
            // check if nft is mine
            if (idToMarketItem[i + 1].owner == msg.sender) {
                // get the id of the market item
                uint256 currentId = i + 1;
                // get the reference to the current market item
                MarketItem storage currentItem = idToMarketItem[currentId];
                // insert into the array
                items[currentIndex] = currentItem;
                // increment the index
                currentIndex += 1;
            }
        }
        return items;
    }

    /* Returns only items a user has listed */
    function fetchItemsListed() public view returns (MarketItem[] memory) {
        uint256 totalItemCount = _tokenIds.current();
        uint256 itemCount = 0;
        uint256 currentIndex = 0;

        for (uint256 i = 0; i < totalItemCount; i++) {
            if (idToMarketItem[i + 1].seller == msg.sender) {
                itemCount += 1;
            }
        }

        MarketItem[] memory items = new MarketItem[](itemCount);
        for (uint256 i = 0; i < totalItemCount; i++) {
            if (idToMarketItem[i + 1].seller == msg.sender) {
                uint256 currentId = i + 1;
                MarketItem storage currentItem = idToMarketItem[currentId];
                items[currentIndex] = currentItem;
                currentIndex += 1;
            }
        }

        return items;
    }
}
