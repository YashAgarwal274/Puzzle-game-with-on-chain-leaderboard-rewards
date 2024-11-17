# Puzzle Game Leaderboard Smart Contract

## Introduction
The **Puzzle Game Leaderboard Smart Contract** is a decentralized application (dApp) for a puzzle game hosted on the Aptos blockchain. This contract allows players to submit their puzzle solutions, receive scores based on their performance, and be ranked on an on-chain leaderboard. The contract also includes a reward pool, where players can earn rewards for their achievements based on their scores.

The contract is designed to provide an immutable, transparent, and decentralized leaderboard where players' achievements are permanently stored on the blockchain. The smart contract ensures that only the top-performing players are listed on the leaderboard, with older or lower scores automatically discarded once the leaderboard exceeds the maximum allowed size.

## Vision
The goal of the **Puzzle Game Leaderboard** is to create a fair, transparent, and competitive environment for puzzle games on the Aptos blockchain. The game leverages the benefits of blockchain technology, including:

- **Decentralization**: No central authority or server controls the leaderboard, making it open and censorship-resistant.
- **Transparency**: Players' scores and actions are recorded on the blockchain, ensuring transparency and fairness in the rankings.
- **Immutable Rewards**: The reward pool is fully managed by the smart contract, ensuring that rewards are automatically distributed according to the game’s rules.

Through this contract, we aim to provide a gaming experience where players can compete for leaderboard positions and rewards in a verifiable and trustless manner.

## Future Goals
While the current contract provides a basic structure for submitting scores and updating the leaderboard, we have several future goals for the **Puzzle Game Leaderboard**:

1. **Extended Game Mechanics**: Add more complex game mechanics, such as different types of puzzles, time limits, and scoring systems.
2. **Reward Distribution Logic**: Implement more advanced reward distribution based on player rankings, allowing for dynamic payout schemes from the reward pool.
3. **Leaderboard Ranking with Tiebreaker**: Implement tiebreaker rules for players with identical scores to determine their positions on the leaderboard.
4. **Player Profiles**: Introduce a system for players to maintain profiles on-chain, allowing them to track their performance over time.
5. **Global and Local Leaderboards**: Expand the leaderboard functionality to support both global and regional (or game-specific) leaderboards.
6. **Interaction with Web3**: Build a user-friendly frontend that allows players to interact with the smart contract via web3, including connecting their wallets and viewing the leaderboard in real-time.

## Deployed Address
The smart contract is currently deployed on the **Aptos Testnet**. Below is the deployed address:

```
Deployed Contract Address: 0x0d7ab48846d71a5f1de2f84543d2edb18f1f4ff42b1e959782e6e4a2a65f17c1
```

You can interact with the contract using the Aptos CLI, or you can use web3-compatible tools (once integrated with a frontend).

## How to Interact with the Contract

To interact with the contract, you can use the following steps:

1. **Deploy the contract**: If you are deploying the contract yourself, make sure you have the Aptos CLI installed and configure your wallet with sufficient tokens to deploy the contract.
   
2. **Initialize the game**: Use the `initialize_game` function to set up the leaderboard and reward pool. This function requires an admin (signer) and an initial reward pool amount in Aptos Coins.
   
3. **Submit Solutions**: Players can submit their puzzle solutions and scores using the `submit_solution` function. This function checks if the score is valid, inserts the player’s score into the leaderboard, and ensures only the top players are kept.

4. **View Leaderboard**: Use a custom script or frontend application to query the current leaderboard.

## Installation and Setup

To interact with the contract or modify it, follow these steps:

1. **Install Move CLI**:
   You can install the Move CLI by following the instructions in the [Aptos documentation](https://aptos.dev/).

2. **Build and Compile the Contract**:
   Navigate to the directory containing your `PuzzleGame.move` file and run:
   ```bash
   move build
   ```

3. **Deploy the Contract**:
   Use the Aptos CLI to deploy the contract to the Aptos network:
   ```bash
   aptos move publish --package-dir ./path_to_your_project
   ```

4. **Interact with the Contract**:
   Once deployed, you can interact with the contract using Aptos CLI commands or by creating a frontend application.

## License
This project is open-source and available under the MIT License.

---

This README file provides a basic overview of the project, its goals, and the deployed address where the smart contract is running.