require 'sinatra'
require 'httparty'

# Set OpenWeatherMap API key
API_KEY = '8caa0b2199c5d28cd28331763d55aed9'

# Home route
get '/' do
  erb :index, locals: { api_key: API_KEY }
end
