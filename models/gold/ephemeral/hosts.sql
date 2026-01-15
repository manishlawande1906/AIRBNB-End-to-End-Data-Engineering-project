{{
    config(materialized='ephemeral')
}}

With hosts as (
    Select 
        HOST_ID,
        HOST_NAME,
        HOST_SINCE,
        RESPONSE_RATE_TAG
    from {{ ref('obt') }}
)

select * from hosts
