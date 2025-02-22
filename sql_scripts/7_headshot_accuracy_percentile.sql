with damage_done as 
    (
    SELECT 
        puuid,
        json_extract(damage_done, '$.headshots') headshots,
        json_extract(damage_done, '$.bodyshots') bodyshots,
        json_extract(damage_done, '$.legshots')  legshots
    FROM val_round_details_sample
    group by puuid
    )
    ,accuracy as 
    (
        select  puuid
            ,   round(((((headshots*1.00)/((headshots*1.00)+(legshots*1.00)+(bodyshots*1.00))))*100),2)||'%' headshot_accuracy
        from damage_done
        group by puuid
    )
    ,percentil as
    (
        SELECT  puuid, 
                headshot_accuracy,
                round((PERCENT_RANK() OVER (ORDER BY headshot_accuracy)*100),0)||"%" AS percentile_rank
        FROM accuracy
    )
    select * from percentil