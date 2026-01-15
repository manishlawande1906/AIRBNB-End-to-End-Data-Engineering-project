{% set configs = [
    {
        "table": ref('silver_bookings'),
        "columns": "Silver_bookings.*",
        "alias": "Silver_bookings"
    },
    {
        'table': ref('silver_listings'),
        'columns': "Silver_listings.HOST_ID, Silver_listings.PROPERTY_TYPE, Silver_listings.ROOM_TYPE, Silver_listings.BEDROOMS, Silver_listings.BATHROOMS, Silver_listings.ACCOMMODATES, Silver_listings.PRICE_PER_NIGHT_TAG, Silver_listings.CREATED_AT as LISTING_CREATED_AT",
        'alias': "Silver_listings",
        'join_condition': 'Silver_listings.LISTING_ID = Silver_bookings.LISTING_ID'      
    },
    {
        'table': ref('silver_hosts'),
        'columns': "Silver_hosts.HOST_NAME, Silver_hosts.HOST_SINCE, Silver_hosts.RESPONSE_RATE_TAG",
        'alias': "Silver_hosts",
        'join_condition': 'Silver_hosts.HOST_ID = Silver_listings.HOST_ID'      
    }
] %}

{{
    config(
        materialized = 'table',
        schema = 'gold'
    )
}}

Select 
    {% for config in configs %}
        {{ config.columns}} {%if not loop.last %}, {%endif%}
    {% endfor %}
from   
    {% for config in configs %}
    {% if loop.first %}
        {{config['table']}} AS {{config['alias']}} 
    {%else%}
        LEFT JOIN {{config['table']}} AS {{config['alias']}} 
        ON {{config['join_condition']}}      
    {%endif%}    
    {% endfor %}