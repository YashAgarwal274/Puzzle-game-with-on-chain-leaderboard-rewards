module PuzzlegameLeaderboardProgram::PuzzleGame {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use std::vector;
    use std::error;

    const MAX_LEADERBOARD_SIZE: u64 = 10;
    const EMINIMUM_SCORE: u64 = 1;
    
    struct PlayerScore has store, drop {
        player: address,
        score: u64,
        time_taken: u64
    }
    
    struct Leaderboard has key {
        scores: vector<PlayerScore>,
        reward_pool: u64
    }
    
    /// Initialize game leaderboard
    public fun initialize_game(admin: &signer, initial_reward_pool: u64) {
        let leaderboard = Leaderboard {
            scores: vector::empty<PlayerScore>(),
            reward_pool: initial_reward_pool
        };
        move_to(admin, leaderboard);
        
        // Fund the reward pool
        let reward_coins = coin::withdraw<AptosCoin>(admin, initial_reward_pool);
        coin::deposit(signer::address_of(admin), reward_coins);
    }
    
    /// Submit puzzle solution and update leaderboard
    public fun submit_solution(
        player: &signer,
        game_admin: address,
        score: u64,
        time_taken: u64
    ) acquires Leaderboard {
        assert!(score > EMINIMUM_SCORE, error::invalid_argument(EMINIMUM_SCORE));
        
        let leaderboard = borrow_global_mut<Leaderboard>(game_admin);
        let player_addr = signer::address_of(player);
        
        let new_score = PlayerScore {
            player: player_addr,
            score,
            time_taken
        };
        
        // Insert score in sorted order
        let i = 0;
        while (i < vector::length(&leaderboard.scores) && 
               score < vector::borrow(&leaderboard.scores, i).score) {
            i = i + 1;
        };
        vector::insert(&mut leaderboard.scores, new_score, i);
        
        // Keep only top scores
        if (vector::length(&leaderboard.scores) > MAX_LEADERBOARD_SIZE) {
            vector::pop_back(&mut leaderboard.scores);
        };
    }
}
