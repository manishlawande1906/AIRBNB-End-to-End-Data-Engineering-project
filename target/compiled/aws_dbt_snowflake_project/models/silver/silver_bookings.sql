

select
    BOOKING_ID,
    LISTING_ID,
    BOOKING_DATE,
    (round(NIGHTS_BOOKED * BOOKING_AMOUNT, 2)) as TOTAL_AMOUNT,
    CLEANING_FEE,
    SERVICE_FEE,
    BOOKING_STATUS,
    CREATED_AT
from AIRBNB.bronze.bronze_bookings