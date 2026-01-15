{{
    config(materialized='ephemeral')
}}

With booking as (
    Select 
        BOOKING_ID,
        BOOKING_DATE,
        BOOKING_STATUS,
        CREATED_AT
    from {{ ref('obt') }}
)

select * from booking
