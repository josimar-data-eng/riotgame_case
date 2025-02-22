SELECT  puuid,
        round(((sum(kills)+sum(assist_count))*1.00)/(sum(death_count)*1.00),2) kda_ratio 
FROM    val_round_details_sample
GROUP BY puuid;