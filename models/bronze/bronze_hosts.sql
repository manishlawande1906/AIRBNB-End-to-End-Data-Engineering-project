{% set incremental_flag = 1 %}
{% set incremental_col = 'CREATED_AT' %}

Select * from {{ source('Staging', 'hosts') }}

{% if incremental_flag == 1 %}
    where {{ incremental_col }} > (select COALESCE(max({{ incremental_col }}), '1900-01-01') from {{ this }})
{% endif %}