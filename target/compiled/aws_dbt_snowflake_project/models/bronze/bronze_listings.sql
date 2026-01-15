


Select * from AIRBNB.Staging.listings


    where CREATED_AT > (select COALESCE(max(CREATED_AT), '1900-01-01') from AIRBNB.bronze.bronze_listings)
