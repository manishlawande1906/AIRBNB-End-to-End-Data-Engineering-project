

With listings as (
    Select 
        LISTING_ID,
        PROPERTY_TYPE,
        ROOM_TYPE,
        PRICE_PER_NIGHT_TAG,
        LISTING_CREATED_AT
    from AIRBNB.gold.obt
)

select * from listings