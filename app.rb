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

get("/from_curr") do
  params.fetch("from_curr")
  erb(:from_curr)
end
