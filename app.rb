require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("XRATE_KEY")}"
  @raw_response = HTTP.get(url)
  @parsed_data = JSON.parse(@raw_response.to_s)
  @currencies = @parsed_data.fetch("currencies")

  erb(:home)
end

get("/:from_curr") do
  @from_curr = params.fetch("from_curr")
  puts params
  url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("XRATE_KEY")}"
  @raw_response = HTTP.get(url)
  @parsed_data = JSON.parse(@raw_response.to_s)
  @currencies = @parsed_data.fetch("currencies")
  
  erb(:from_curr)
end
