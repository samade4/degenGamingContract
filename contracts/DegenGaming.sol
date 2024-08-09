// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGaming is ERC20, Ownable {
    // Define User struct
    struct Player {
        address account;
        string items;
    }

    // Define GameItems enum
    enum GameItems {
        NoItem,
        LegendarySkin,
        PowerBoost,
        VIPAccess,
        RareWeapon,
        GamePass,
        MysteryBox
    }

    // Mappings
    mapping(address => Player) public players;
    mapping(GameItems => uint256) public itemPrice;
    mapping(GameItems => string) public itemNames;

    // Events
    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);
    event ItemRedeemed(address indexed user, GameItems item);

    // Constructor
    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        // Set item prices
        itemPrice[GameItems.LegendarySkin] = 50 * 10 ** 18;
        itemPrice[GameItems.PowerBoost] = 30 * 10 ** 18;
        itemPrice[GameItems.VIPAccess] = 40 * 10 ** 18;
        itemPrice[GameItems.RareWeapon] = 60 * 10 ** 18;
        itemPrice[GameItems.GamePass] = 100 * 10 ** 18;
        itemPrice[GameItems.MysteryBox] = 20 * 10 ** 18;

        // Initialize item names
        itemNames[GameItems.LegendarySkin] = "LegendarySkin";
        itemNames[GameItems.PowerBoost] = "PowerBoost";
        itemNames[GameItems.VIPAccess] = "VIPAccess";
        itemNames[GameItems.RareWeapon] = "RareWeapon";
        itemNames[GameItems.GamePass] = "GamePass";
        itemNames[GameItems.MysteryBox] = "MysteryBox";
        itemNames[GameItems.NoItem] = "NoItem";
    }

    // Mint new tokens
    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
        emit TokensMinted(_to, _amount);
    }

    // Redeem an item
    function redeemItem(GameItems item) external {
        uint256 price = itemPrice[item];
        require(balanceOf(msg.sender) >= price, "Insufficient DGN balance");

        _transfer(msg.sender, address(this), price);

        Player storage player = players[msg.sender];
        player.account = msg.sender;
        player.items = (itemNames[item]);

        emit ItemRedeemed(msg.sender, item);
    }

    // Transfer tokens
    function transferDegenT(
        address _to,
        uint256 _amount
    ) external returns (bool success) {
        require(balanceOf(msg.sender) >= _amount, "Insufficient DGN Token");
        return transfer(_to, _amount);
    }

    // Burn tokens
    function burn(uint256 _amount) external {
        require(balanceOf(msg.sender) >= _amount, "Insufficient DGN Token");
        _burn(msg.sender, _amount);
        emit TokensBurned(msg.sender, _amount);
    }

    // Check balance
    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }
}
