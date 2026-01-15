{{ 
    config(materialized='incremental', 
    unique_key='LISTING_ID') }}
Select
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    BEDROOMS,
    BATHROOMS,
    ACCOMMODATES,
    {{ tag('CAST(PRICE_PER_NIGHT AS INT)')}} as PRICE_PER_NIGHT_TAG,
    CREATED_AT

from   
    {{ ref('bronze_listings') }}    

{% if is_incremental() %}
where CREATED_AT > (select max(CREATED_AT) from {{ this }})
{% endif %}