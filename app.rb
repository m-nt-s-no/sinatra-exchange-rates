require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("XRATE_KEY")}"
  @response = HTTP.get(url).to_s
  @data = JSON.parse(@response)
  #@currencies = @data.fetch("currencies")

  erb(:home)
end
