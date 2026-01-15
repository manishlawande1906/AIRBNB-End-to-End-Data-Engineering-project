



Select 
    
        Silver_bookings.* , 
    
        Silver_listings.HOST_ID, Silver_listings.PROPERTY_TYPE, Silver_listings.ROOM_TYPE, Silver_listings.BEDROOMS, Silver_listings.BATHROOMS, Silver_listings.ACCOMMODATES, Silver_listings.PRICE_PER_NIGHT_TAG, Silver_listings.CREATED_AT as LISTING_CREATED_AT , 
    
        Silver_hosts.HOST_NAME, Silver_hosts.HOST_SINCE, Silver_hosts.RESPONSE_RATE_TAG 
    
from   
    
    
        AIRBNB.silver.silver_bookings AS Silver_bookings 
        
    
    
        LEFT JOIN AIRBNB.silver.silver_listings AS Silver_listings 
        ON Silver_listings.LISTING_ID = Silver_bookings.LISTING_ID      
        
    
    
        LEFT JOIN AIRBNB.silver.silver_hosts AS Silver_hosts 
        ON Silver_hosts.HOST_ID = Silver_listings.HOST_ID      
        
    