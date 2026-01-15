

With booking as (
    Select 
        BOOKING_ID,
        BOOKING_DATE,
        BOOKING_STATUS,
        CREATED_AT
    from AIRBNB.gold.obt
)

select * from booking