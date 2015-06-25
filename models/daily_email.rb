require "rest-client"
require 'giphy'
require 'pry'
require 'json'
require 'open-uri'
require 'weather-underground'

class DailyEmail
  def initialize
    @emails = ["arushigupta101@gmail.com", "aditi100gupta@gmail.com"]
    
  end
  
  def send_daily_email
    @gif = Giphy.random(tag='puppy').image_original_url
    
    client = WeatherUnderground::Base.new
    result = client.SimpleForecast( '10028' )
    @weather_conditions = result.days[0].conditions
    @weather_high = result.days[0].high.fahrenheit
    @weather_low = result.days[0].low.fahrenheit
    
    url = open('http://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=8d4f4955fc1ec5ba9bb216928505e58b:18:71651992')

      response_hash = JSON.load(open(url))
      @url = response_hash["response"]["docs"][0]["web_url"] 
      @headline = response_hash["response"]["docs"][0]["headline"]["main"]
      @snippet = response_hash["response"]["docs"][0]["snippet"]    
    
    @emails.each do |email|
      RestClient.post "https://api:key-3f0bf97cdc41cba9bb58712d34992b25"\
    "@api.mailgun.net/v3/sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org/messages",
      :from => "Mailgun Sandbox <postmaster@sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org>",
      :to => email, 
      :subject => "Your Daily Update",
      :html => "<html><img src=#{@gif}> 
<h2>#{@headline}</h2> 
<h4>#{@snippet}</h4> 
View the full article here: #{@url} 
<br>
<h2>Today will be: #{@weather_conditions}.
The high for today is: #{@weather_high} degrees Fahrenheit.
The low for today is: #{@weather_low} degrees Fahrenheit.</h2>
<br>
<h5>The news update is from the New York Times. The weather conditions are for New York, NY 10028. The weather information is from the Weather Underground Database.</h5>
<br>
<h5>Brought to you by the Daily Update.</h5></html>" 
      
    end   
  end
end

test_email = DailyEmail.new
test_email.send_daily_email