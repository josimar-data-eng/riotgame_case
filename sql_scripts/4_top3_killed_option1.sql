with kill_victim_puuid_exploded as 
    (
        SELECT  puuid, 
                json_each.value kill_victim_puuid
        FROM    val_round_details_sample
            ,   json_each(val_round_details_sample.kill_victim_puuids)
        -- where   puuid in (/*'xxxxxxxx-0002-5163-a9bf-eb4cc07e9eed',*/'xxxxxxxx-01df-5ec3-8ca0-acb1469ca6e0')
    )
    ,kill_rank as 
    (
    SELECT 
        puuid, 
        json_group_array(kill_victim_puuid) AS kill_victim_puuids,
        kill_count,
        dense_rank() OVER (PARTITION BY puuid ORDER BY kill_count DESC) AS rank
    FROM 
        (
            SELECT 
                puuid, 
                kill_victim_puuid, 
                count(1) kill_count,
                dense_rank() OVER (PARTITION BY puuid ORDER BY count(1) DESC) AS rank
            FROM kill_victim_puuid_exploded
            GROUP BY puuid, kill_victim_puuid
        )
    GROUP BY puuid,kill_count
    -- order by kill_count desc limit 3                               
    )                        
    SELECT  k1.puuid,
            COALESCE(k1.kill_victim_puuids, 'N/A') AS top_1_victim_puuid,
            COALESCE(k1.kill_count, 0)            AS top_1_victim_qty,
            COALESCE(k2.kill_victim_puuids, 'N/A') AS top_2_victim_puuid,
            COALESCE(k2.kill_count, 0)            AS top_2_victim_qty,
            COALESCE(k3.kill_victim_puuids, 'N/A') AS top_3_victim_puuid,
            COALESCE(k3.kill_count, 0)            AS top_3_victim_qty
    FROM      (SELECT puuid, kill_victim_puuids, kill_count FROM kill_rank WHERE rank = 1) k1
    LEFT JOIN (SELECT puuid, kill_victim_puuids, kill_count FROM kill_rank WHERE rank = 2) k2  ON k1.puuid = k2.puuid
    LEFT JOIN (SELECT puuid, kill_victim_puuids, kill_count FROM kill_rank WHERE rank = 3) k3  ON k1.puuid = k3.puuid
