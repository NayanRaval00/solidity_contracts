// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

/**
 * @title SimpleLottery
 * @dev A basic lottery contract for learning Solidity concepts
 */
contract SimpleLottery {
    // State variables
    address public manager;           // Person who manages the lottery
    address[] public players;         // Array of players who entered
    address public lastWinner;        // Address of the last winner
    uint public ticketPrice;          // Price to enter the lottery (in wei)
    
    // Events - helpful for tracking contract activity
    event PlayerEntered(address indexed player);
    event WinnerPicked(address indexed winner, uint amount);
    
    // Constructor - runs once when contract is deployed
    constructor() {
        manager = msg.sender;         // Person deploying is the manager
        ticketPrice = 0.01 ether;     // Set ticket price to 0.01 ETH
    }
    
    // Modifier - reusable code to restrict access
    modifier onlyManager() {
        require(msg.sender == manager, "Only manager can call this");
        _;
    }
    
    // Function to enter the lottery (payable means it can receive ETH)
    function enter() public payable {
        require(msg.value >= ticketPrice, "Minimum ticket price not met");
        players.push(msg.sender);
        emit PlayerEntered(msg.sender);
    }
    
    // Function to get a pseudo-random number (NOT secure for production!)
    function random() private view returns (uint) {
        // This is for learning only - use Chainlink VRF in production
        // Using block.prevrandao (replaces block.difficulty after The Merge)
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players)));
    }
    
    // Function to pick a winner (only manager can call)
    function pickWinner() public onlyManager {
        require(players.length > 0, "No players in the lottery");
        
        // Pick a random winner
        uint index = random() % players.length;
        address winner = players[index];
        
        // Transfer the entire balance to the winner
        uint prizeAmount = address(this).balance;
        payable(winner).transfer(prizeAmount);
        
        // Record the winner and emit event
        lastWinner = winner;
        emit WinnerPicked(winner, prizeAmount);
        
        // Reset the lottery for next round
        players = new address[](0);
    }
    
    // Function to get all players
    function getPlayers() public view returns (address[] memory) {
        return players;
    }
    
    // Function to get the number of players
    function getPlayerCount() public view returns (uint) {
        return players.length;
    }
    
    // Function to get the current prize pool
    function getPrizePool() public view returns (uint) {
        return address(this).balance;
    }
    
    // Function to change ticket price (only manager)
    function setTicketPrice(uint _price) public onlyManager {
        ticketPrice = _price;
    }
}

/**
 * HOW TO USE IN REMIX:
 * 
 * 1. DEPLOY:
 *    - Select "Injected Provider - MetaMask" or "Remix VM" as environment
 *    - Click "Deploy"
 * 
 * 2. ENTER LOTTERY:
 *    - In the "VALUE" field, enter 10000000000000000 (0.01 ETH in wei)
 *    - Or select "ether" from dropdown and enter 0.01
 *    - Click "enter" button
 *    - Repeat with different accounts to add more players
 * 
 * 3. CHECK STATUS:
 *    - Click "getPlayerCount" to see number of players
 *    - Click "getPrizePool" to see total ETH in contract
 *    - Click "getPlayers" to see all player addresses
 * 
 * 4. PICK WINNER:
 *    - Make sure you're using the manager account (who deployed)
 *    - Click "pickWinner"
 *    - Check "lastWinner" to see who won
 * 
 * KEY CONCEPTS DEMONSTRATED:
 * - State variables (storage)
 * - Constructor
 * - Modifiers (access control)
 * - Payable functions (receiving ETH)
 * - Arrays
 * - Events
 * - Transfers
 * - View/Pure functions
 * - require statements (validation)
 */