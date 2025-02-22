SELECT  puuid
    ,   sum(player_won_round) rounds_won
    ,   printf("%.0f%%", ROUND(((SUM(player_won_round) * 1.0) / (COUNT(player_won_round) * 1.0) * 100), 0)) round_win_rate
FROM val_round_details_sample
GROUP BY puuid;