# Daily Weather Forecast Web Application

## Abstract

The Daily Weather Forecast web application aims to provide users with up-to-date weather information for their current location along with nearby recommendations based on weather conditions. The project involves integrating weather data from the OpenWeatherMap API, displaying it dynamically on a web page, and fetching location-based recommendations through a custom API.

## Overview

The project consists of a web application built using HTML, CSS, JavaScript, Ruby, and the Sinatra web framework. It utilizes the OpenWeatherMap API for weather data retrieval and Google Maps API for location-based services. The application dynamically updates weather information based on the user's current location and displays nearby recommendations for activities such as restaurants, events, and sports based on the weather conditions.

### Solution Components

1. **Weather Information Display:** Fetches weather data from the OpenWeatherMap API and displays it dynamically on the web page.
2. **Location Services:** Utilizes the Google Maps API to determine the user's current location and display it on the map.
3. **Recommendation Engine:** Retrieves location-based recommendations through a custom API endpoint based on weather conditions and displays them to the user.

## Implementation

### Technologies Used

- HTML, CSS, JavaScript for front-end development
- Ruby and Sinatra for back-end development
- OpenWeatherMap API for weather data
- Google Maps API for location services
- Bootstrap for styling

### Key Features

- Dynamic weather information display based on user's current location
- Interactive map showing the user's current location
- Nearby recommendations for restaurants, events, and sports based on weather conditions

### Solution Design

The web application consists of multiple components:

1. **Front-End:** HTML, CSS, and JavaScript files for user interface design and interaction.
2. **Back-End:** Ruby files using the Sinatra framework to handle API requests and responses.
3. **API Integration:** Integration with OpenWeatherMap API and Google Maps API for weather data and location services.
4. **Recommendation Engine:** Custom API endpoint to fetch location-based recommendations.

## Operation

To run the Daily Weather Forecast web application locally:

1. Clone this repository to your local machine.
2. Install the required dependencies by running `bundle install`.
3. Set up your API keys for OpenWeatherMap and Google Maps, and OpenAI in the appropriate keys at `app.rb`.
4. Run the application using the command `ruby app.rb`.
5. Access the application in your web browser at `http://localhost:4567`.

## Usage

1. Upon accessing the application, it will prompt you to allow location access to determine your current location.
2. Once the location is determined, the application will display the current weather information along with nearby recommendations.
3. You can click on the map to explore different areas and view recommendations based on weather conditions in those locations.

## Conclusion

The Daily Weather Forecast web application provides users with real-time weather information and location-based recommendations, enhancing their experience and assisting them in planning outdoor activities accordingly.
