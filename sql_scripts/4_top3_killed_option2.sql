with kill_victim_puuid_exploded as 
    (
        SELECT  puuid, 
                json_each.value kill_victim_puuid
        FROM    val_round_details_sample
            ,   json_each(val_round_details_sample.kill_victim_puuids)
        where   puuid in ('xxxxxxxx-0002-5163-a9bf-eb4cc07e9eed','xxxxxxxx-01df-5ec3-8ca0-acb1469ca6e0')
    )
    ,kill_rank as 
    (
        SELECT 
            puuid,
            kill_victim_puuid,
            count(1) kill_count,
            dense_rank() OVER (PARTITION BY puuid ORDER BY count(1) DESC) AS top3_killed_position
        FROM kill_victim_puuid_exploded
        GROUP BY puuid, kill_victim_puuid
    )
select  puuid
    ,   kill_victim_puuid
    ,   kill_count
    ,   top3_killed_position
FROM   kill_rank 
WHERE  top3_killed_position <= 3
order by puuid,top3_killed_position desc 