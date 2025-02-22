SELECT 
    puuid,
    count(json_extract(damage_done, '$.headshots')) headshots,
    count(json_extract(damage_done, '$.bodyshots')) bodyshots,
    count(json_extract(damage_done, '$.legshots'))  legshots
FROM val_round_details_sample
group by puuid