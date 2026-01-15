
Select
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    BEDROOMS,
    BATHROOMS,
    ACCOMMODATES,
    
    CASE 
        WHEN CAST(PRICE_PER_NIGHT AS INT) < 100 THEN 'Low'
        WHEN CAST(PRICE_PER_NIGHT AS INT) < 200 THEN 'Medium'
        ELSE 'High'
    END

 as PRICE_PER_NIGHT_TAG,
    CREATED_AT

from   
    AIRBNB.bronze.bronze_listings    


where CREATED_AT > (select max(CREATED_AT) from AIRBNB.silver.silver_listings)
