require 'sinatra'
require 'httparty'
require 'json'

# Set API keys
OPENWEATHERMAP_API_KEY = 'API_KEY'
OPENAI_API_KEY = 'API_KEY' # Update this with your OpenAI API key
GOOGLE_MAPS_API_KEY = 'API_KEY'

# Home route
get '/' do
  erb :index, locals: { 
    openweathermap_api_key: OPENWEATHERMAP_API_KEY,
    google_maps_api_key: GOOGLE_MAPS_API_KEY
  }
end

post '/recommendations' do
  content_type :json

  request_payload = JSON.parse(request.body.read)
  latitude = request_payload['latitude']
  longitude = request_payload['longitude']

  openai_response = HTTParty.post(
    'https://api.openai.com/v1/chat/completions',
    headers: {
      'Authorization' => "Bearer #{OPENAI_API_KEY}",
      'Content-Type' => 'application/json'
    },
    body: {
      model: "gpt-3.5-turbo",
      messages: [
        {
          role: "system",
          content: "You are a helpful assistant."
        },
        {
          role: "user",
          content: "Generate three recommendations for each of the following categories based on the current weather and location (latitude #{latitude}, longitude #{longitude}): restaurants, musical events, and sports events. Format as JSON with each entry having a name, latitude, longitude, address, and description."
        }
      ]
    }.to_json
  )

  puts "OpenAI Response: #{openai_response.body}"

  if openai_response.code == 200
    begin
      # Remove the ```json and ``` delimiters
      content = openai_response['choices'][0]['message']['content'].gsub(/```json|```/, '').strip
      puts "Raw Content: #{content}"  # Log the raw content received

      recommendations = JSON.parse(content)
      puts "Parsed JSON: #{recommendations}"  # Log the parsed JSON

      parsed_recommendations = parse_recommendations(recommendations)
      puts "Parsed Recommendations: #{parsed_recommendations}"  # Log the parsed recommendations

      { recommendations: parsed_recommendations }.to_json
    rescue JSON::ParserError => e
      puts "Error parsing response: #{e.message}"
      { recommendations: [] }.to_json
    rescue StandardError => e
      puts "Unexpected error: #{e.message}"
      { recommendations: [] }.to_json
    end
  else
    puts "OpenAI API request failed with status #{openai_response.code}"
    { recommendations: [] }.to_json
  end
end

def parse_recommendations(response)
  response.flat_map do |category, items|
    items.map do |item|
      {
        name: item['name'],
        latitude: item['latitude'],
        longitude: item['longitude'],
        address: item['address'],
        description: item['description'],
        category: category
      }
    end
  end
end
