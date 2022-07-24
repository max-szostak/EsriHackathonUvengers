#API Key is 96b6e62e756d9c1c881aa0c68af34af9
#Dummy lat is 34.0603
#Dummy lon is -117.197487
#Exclude minutely,daily,hourly,alerts

import requests
import pandas
import json


places = ["San Diego",
"Phoenix",
"Las Vegas",
"Bismark",
"San Francisco",
"Reno",
"Casper",
"Grants Pass",
"Bend",
"Seattle",
"Missoula",
"Pocatello",
"Salt Lake City",
"Albuquerque",
"Wichita",
"Dallas",
"Austin",
"Odessa",
"Memphis",
"New Orleans",
"Springfield MI",
"Savannah", 
"Montgomery",
"Orlando",
"Miami",
"Charlotte",
"Columbus",
"Mt Pleasant",
"Pittsburgh",
"New York",
"Providence",
"Rangeley",
"Great Falls",
"Denver",
"Minneapolis",
"Des Moines",
"Lemmon"]

lat = [32.7541526,
33.31197058,
36.50434532,
46.90332916,
37.881352,
39.58845645,
43.0095579,
42.447569,
44.10759265,
47.69477858,
46.88441822,
42.96354535,
40.81259233,
35.27765775,
37.85703649,
32.8913046,
30.3755839,
31.8682578,
35.18770195,
30.01069361,
37.2604715,
32.21055933,
32.47418632,
28.61835575,
25.84426486,
35.36751368,
39.90010552,
43.62536364,
40.46927917,
40.78303268,
41.83561071,
44.98174929,
47.60437322,
39.85490059,
45.1689048,
41.74675469,
45.93692089]

lon = [-117.1549576,
-111.7528757,
-115.1747,
-100.7973895,
-122.3266169,
-119.8017309,
-106.3506521,
-123.4087109,
-121.2628635,
-122.3524015,
-114.0277709,
-112.4403924,
-111.9136136,
-106.7118332,
-97.35079987,
-96.78179597,
-97.73625427,
-102.380061,
-90.08223306,
-90.13729796,
-93.34941723,
-80.95981434,
-86.33781974,
-81.38197866,
-80.24397069,
-80.9231045,
-82.99721584,
-84.75540653,
-79.98852172,
-73.91956354,
-71.33099378,
-70.66634665,
-111.3810696,
-105.0495153,
-93.35375371,
-93.61640662,
-102.1437258]

uvi_list =[]


def callAPI(myPlace, thisLat, thisLon, uvi_list):
    requestStr = "https://api.openweathermap.org/data/3.0/onecall?lat=" + str(thisLat) + "&lon=" + str(thisLon) + "&exclude=minutely,daily,hourly,alerts&appid=90261d64449cb0bd8456d0313118314b"
    openweatherreturn = requests.get(requestStr)

    openweatherreturn = openweatherreturn.json()
    uvi = openweatherreturn['current']['uvi']

    uvi_list.append(uvi)

    return uvi_list

for place in range(len(places)):
    place_lat = lat[place]
    place_lon = lon[place]
    place_place = places[place]

    callAPI(place_place, place_lat, place_lon, uvi_list)


df = pandas.DataFrame(
    {
       'City': places,
        'UVI': uvi_list,
        'Latitude': lat,
        'Longitude': lon
    }
)

df.to_csv("UVI.csv")