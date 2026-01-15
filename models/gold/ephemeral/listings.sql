{{
    config(materialized='ephemeral')
}}

With listings as (
    Select 
        LISTING_ID,
        PROPERTY_TYPE,
        ROOM_TYPE,
        PRICE_PER_NIGHT_TAG,
        LISTING_CREATED_AT
    from {{ ref('obt') }}
)

select * from listings
