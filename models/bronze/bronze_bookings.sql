{{ config(materialized = 'incremental')}}


Select * from {{ source('Staging', 'bookings') }}

{% if is_incremental() %}
    where CREATED_AT > (select COALESCE(max(CREATED_AT), '1900-01-01') from {{this}})
{% endif %}