

SELECT 
    HOST_ID,
    REPLACE(HOST_NAME, ' ', '_') as HOST_NAME,
    HOST_SINCE,
    RESPONSE_RATE,
    CASE
    WHEN RESPONSE_RATE > 90 THEN 'VERY_GOOD'
    WHEN RESPONSE_RATE < 80 THEN 'GOOD'
    WHEN RESPONSE_RATE < 60 THEN 'FAIR'
    ELSE 'BAD'
    END as RESPONSE_RATE_TAG,
    CREATED_AT

FROM   
    AIRBNB.bronze.bronze_hosts    


    where CREATED_AT > (select COALESCE(max(CREATED_AT), '1900-01-01') from AIRBNB.silver.silver_hosts)
