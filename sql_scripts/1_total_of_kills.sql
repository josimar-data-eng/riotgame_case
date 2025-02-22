SELECT  puuid
    ,   sum(kills) kills
    ,   sum(assist_count) assists
    ,   sum(death_count)  deaths
FROM    val_round_details_sample
GROUP BY puuid;

