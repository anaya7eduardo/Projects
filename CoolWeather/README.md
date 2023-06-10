# Cool Weather

## Given Data
-Given this weather API endpoint, display the data on screen
-Endpoint: https://api.weatherapi.com/v1/current.json?key=9745357b64764a1c926173930223105&q=London&aqi=no
-Display this data on a single screen 
-Data we care about 
-Location Name 
-Condition Text 
-Location local time 
-Follow up additional work 
-Build the ability to pass in different cities. 
-Build the ability to show temperature in celsius or fahrenheit 

Follow up questions: 
-How testable is this solution?  : Very testable, UI can be tested with different inputs allowing us to check the behaviour with wrong inputs 
-What mobile architecture did they use? : MVVM
-Why? : I choose that because given the information at some point features could be added and in order to keep everything separated and well organized the perfect fit for me was MVVM
-If we wanted to cache these results how would we do so? : Since it's not secure information NSUserDefaults is the best option, in case we want to store more than one I would use CoreData instead.

## API Model

{
    "location":{
        "name":"London",
        "region":"City of London, Greater London",
        "country":"United Kingdom",
        "lat":51.52,
        "lon":-0.11,
        "tz_id":"Europe/London",
        "localtime_epoch":1686238531,
        "localtime":"2023-06-08 16:35"
    },
    "current":{
        "last_updated_epoch":1686238200,
        "last_updated":"2023-06-08 16:30",
        "temp_c":22.0,
        "temp_f":71.6,
        "is_day":1,
        "condition":{
            "text":"Sunny",
            "icon":"//cdn.weatherapi.com/weather/64x64/day/113.png",
            "code":1000
        },
        "wind_mph":13.6,
        "wind_kph":22.0,
        "wind_degree":70,
        "wind_dir":"ENE",
        "pressure_mb":1016.0,
        "pressure_in":30.0,
        "precip_mm":0.0,
        "precip_in":0.0,
        "humidity":38,
        "cloud":0,
        "feelslike_c":24.0,
        "feelslike_f":75.2,
        "vis_km":10.0,
        "vis_miles":6.0,
        "uv":6.0,
        "gust_mph":13.6,
        "gust_kph":22.0
    }
}
