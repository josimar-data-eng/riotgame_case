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
select  puuid
    ,   round(((((headshots*1.00)/((headshots*1.00)+(legshots*1.00)+(bodyshots*1.00))))*100),2)||'%' headshot_accuracy
from damage_done
group by puuid