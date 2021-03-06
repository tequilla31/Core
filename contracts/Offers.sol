// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;


import "./Assets.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/GSN/Context.sol";
import "./Storage/StoreProxy.sol";

contract Offers is Context {

    /*
     * @dev add a new offer  event 
     */
    event NewOffer(uint256 offerId);
    
    event DisableOffer(uint256 offerId);

    event UpdateOffer(uint256 offerId);

    // @dev get variables for the data store 
    bytes32 TOTAL_OFFERS_STORE_KEY = keccak256("Offers_total_offers");

    // offer types
    bytes32 OFFER_TYPE_BUY  =  keccak256("buy");
    bytes32 OFFER_TYPE_SELL = keccak256("sell");

    Assets  _assets = Assets(address(this)); 
    StoreProxy dataStore;

    /**
     * @dev add a  new offer 
     * @param asset contract address
     * @param offerType offer type, sell or buy offer
     * @param pricingMode mode of pricing, either market or fixed
     * @param profitMargin if pricing mode is market, then profit margin in %
     * @param fixedPrice if pricing mode is fixed, then the fixed offer price
     * @param countryCode the two letter country code
     * @param currencyCode the two letter currency code
     * @param paymentTypeId the paymentTypeId
     * @param minTradeLimit minimum trade limit for this offer
     * @param maxTradeLimit maximum trade limit for this offer
     * @param hasSecurityDeposit wether security deposit is enabled
     * @param securityDepositRate if security deposit is enabled, then the required % 
     * @param paymentWindow the time within which payment has to be made before expires 
     * @param partnerMinRequiredTrades the minimum trades required by a partner
     * @param partnerMinReputation minimum reputation required by a partner
     * @param externalInfoHash ipfs or siaskynet has for payment terms and info
     * @param externalStoreId where the external info was stored
     * @param isEnabled is offer enabled
     * @param expiry if an expiry is set
     */
     function newOffer(
        address  asset,
        bytes32    offerType,
        string   memory pricingMode,
        uint256  profitMargin,
        uint256  fixedPrice,
        bytes32  countryCode,
        bytes32  currencyCode,
        uint256  paymentTypeId,
        uint256  minTradeLimit,
        uint256  maxTradeLimit,
        bool     hasSecurityDeposit,
        uint256  securityDepositRate,
        uint256  paymentWindow,
        uint256  partnerMinRequiredTrades,
        uint256  partnerMinReputation,
        string   memory  externalInfoHash,
        int      externalStoreId,
        bool     isEnabled,
        uint256  expiry
     ) external {

        //validate country
        require(countryCode.length == 2, "XPIE:INVALID_COUNTRY_CODE");

        require(currencyCode.length == 2, "XPIE:INVALID_CURRENCY_CODE");

        //check if asset is supported
        require(_assets.isAssetSupported(asset),"XPIE:UNSUPPORTED_ASSET");
    
        require((offerType == OFFER_TYPE_BUY || offerType == OFFER_TYPE_SELL), "XPIE:INVALID_OFFER_TYPE");

        //save offer data 
        //lets get nextOfferId
        uint256 offerId = dataStore.getNextOfferId();


     }

}  //end contract 