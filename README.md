# AstroFlow Backend

> A rails backend for a service oriented application. A user can request and receieve data from endpoints for horoscopes and a daily flow chart. Endpoints include querying daily horoscopes, flow charts, and moon positions. Multiple API endpoints are consumed for the horoscope call, and their data is integrated into the JSON body of the response. 

## AstroFlow Frontend

> To see the Frontend application on github for this project [click here](https://github.com/jwgalvin/astroflow_fe).
> 
> To visit the application on heroku [click here](https://astro-flow.herokuapp.com) 

## Design Principles: 
The design of this application relies on the facade design pattern. Here's a very high level overview: 
* A controller receives a request from the front end and intiates the creation of a facade, and passes it data(params, from JSON or query). 
* A facade is a ruby class that initializes a Service, and sends the service data to a PORO. 
* A service calls an external api enpoint and returns parsed JSON. 
* The parsed JSON is turned into a Ruby object through a PORO. 
* The object is serialized and sent to the route matching the controller action. 

## Contributors
🩹[Jessica Grazulis](https://github.com/jgrazulis)
🌚[TJ Williams](https://github.com/T-willjr)
🌝[Joe Galvin](https://github.com/jwgalvin)
🩸[Sully Birashk](https://github.com/SullyBirashk)
🔮[Sam Ivari](https://github.com/sam-ivari)

# Getting Started

## Development setup
```ruby 2.7.4```

```rails 5.2.6```

## Gems

![pry v badge](https://img.shields.io/gem/v/pry?color=blue&label=pry)
![shoulda-matchers v badge](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers)
![rspec v badge](https://img.shields.io/gem/v/rspec?color=orange&label=rspec)
![simplecov v badge](https://img.shields.io/gem/v/simplecov?color=green&label=simplecov)
![json-apiserializer](https://img.shields.io/badge/json-apiserializer-blue)

![faraday](https://img.shields.io/badge/faraday-red)
![vcr](https://img.shields.io/badge/vcr-orange)
![capybara](https://img.shields.io/badge/capybara-green)
![figaro](https://img.shields.io/badge/figaro-blue)

## Setup

1. clone this repository 
2. cd into 'astroflow_be' directory 
3. run ```'bundle install' to install gems```
7. run ```rake db:{drop,create,migrate,seed} to prepare the database ```
8. run ```bundle exec rspec``` to run the test suite (run after api set up)
9. run ```rails s``` to launch the production environment
10. send requests to "https://localhost:5000". 

## Api set up 

1. run ```'bundle exec figaro install'``` to create application.yml file in the config folder
2. Sign up for a free api key [here](https://rapidapi.com/sameer.kumar/api/aztro/)
3. Add api key to the application.yml file ```api_key: insert api key here```
4. Add ```/config/application.yml``` to .gitignore file


## Schema


![Screen Shot 2022-04-21 at 5 45 24 PM](https://user-images.githubusercontent.com/89754305/164557393-f62a356b-e07f-422f-9ef2-a83aec5387ea.png)


## Get today & yesterdays horoscope 

### GET  http://localhost:5000/api/v1/horoscopes/find?sign=leo
```
{
    "today_horoscope": {
        "current_date": "April 22, 2022",
        "description": "For the next three days, a certain urgent undertone will be automatically added to each and every encounter. Does that mean you'll be feeling unhappy? Hardly. Passionate, maybe -- so why waste time pouting?",
        "compatibility": "Sagittarius",
        "mood": "Energetic",
        "color": "Sky Blue",
        "lucky_number": "30",
        "lucky_time": "5am",
        "moon": "Grass Moon",
        "moon_phase": "Waning Gibbous"
    },
    "yesterday_horoscope": {
        "current_date": "April 21, 2022",
        "description": "Someone you've always thought of as 'just a friend' will be along shortly with a bold, brazen comment -- one you might not mind hearing at all. This won't be a typical day, but it will be memorable.",
        "compatibility": "Aries",
        "mood": "Productive",
        "color": "Silver",
        "lucky_number": "92",
        "lucky_time": "4pm",
        "moon": "Grass Moon",
        "moon_phase": "Waning Gibbous"
    }
}

```

## Create a user  

### POST http://localhost:5000/api/v1/users
```
JSON Raw Body: 

{ 
    "email": "test@gmail.com"
}

```
## Create a daily flow chart 

### POST http://localhost:5000/api/v1/users/daily_flow_chart?email=#{email}
```
Condensed Response: 

```
## Edit a flow chart 

### PATCH http://localhost:5000/api/v1/users/daily_flow_chart?email=#{email}

```
JSON raw body:

```
```
Response:

```
## Get a flow chart

### GET http://localhost:5000/api/v1/users/daily_flow_chart?email=#{email}&date=#{Date.today}
```
JSON raw body: 

```
```
Response:

```

