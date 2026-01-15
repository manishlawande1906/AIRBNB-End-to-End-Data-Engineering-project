
  
    

create or replace transient table AIRBNB.bronze.bronze_hosts
    
    
    
    as (


Select * from AIRBNB.Staging.hosts


    where CREATED_AT > (select COALESCE(max(CREATED_AT), '1900-01-01') from AIRBNB.bronze.bronze_hosts)

    )
;


  