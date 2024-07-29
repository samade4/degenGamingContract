// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGaming is ERC20, Ownable {
    struct User {
        address account;
        GameItems item;
    }

    enum GameItems {
        LegendarySkin, // Rare skin for characters
        PowerBoost, // Temporary increase in stats
        VIPAccess, // Access to exclusive game areas
        RareWeapon, // Unique weapon with special attributes
        GamePass, // Subscription or pass for special content
        MysteryBox // Box with random items or bonuses
    }

    mapping(address => User) user;
    mapping(GameItems => uint256) public itemPrice;

    User[] public degen;

    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);
    event ItemRedeemed(address indexed user, GameItems item);

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        // Updated item prices with modern gaming context
        itemPrice[GameItems.LegendarySkin] = 50 * 10 ** 18;
        itemPrice[GameItems.PowerBoost] = 30 * 10 ** 18;
        itemPrice[GameItems.VIPAccess] = 40 * 10 ** 18;
        itemPrice[GameItems.RareWeapon] = 60 * 10 ** 18;
        itemPrice[GameItems.GamePass] = 100 * 10 ** 18;
        itemPrice[GameItems.MysteryBox] = 20 * 10 ** 18;
    }

    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);

        emit TokensMinted(_to, _amount);
    }

    function redeemItem(GameItems item) external {
        require(
            balanceOf(msg.sender) >= itemPrice[item],
            "Insufficient DGN balance"
        );

        uint256 bal = getBalance();
        bal -= itemPrice[item];

        _transfer(msg.sender, address(this), itemPrice[item]);

        User storage gamer = user[msg.sender];
        gamer.item = item;
        gamer.account = msg.sender;

        degen.push(gamer);

        emit ItemRedeemed(msg.sender, item);
    }

    function transferDegenT(
        address _to,
        uint256 _amount
    ) external returns (bool success) {
        require(balanceOf(msg.sender) >= _amount, "Insufficient DGN Token");

        return transfer(_to, _amount);
    }

    function burn(uint256 _amount) external {
        require(balanceOf(msg.sender) >= _amount, "Insufficient DGN Token");
        _burn(msg.sender, _amount);

        emit TokensBurned(msg.sender, _amount);
    }

    function getBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }
}
