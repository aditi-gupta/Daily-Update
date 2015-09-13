require "rest-client"
require "giphy"
require "pry"
require "json"
require "open-uri"
require "weather-underground"

class DailyEmail
  def initialize
    @users = {
      "arushigupta101@gmail.com" => "10028",
      "aditi100gupta@gmail.com" => "10028",
      "ellapapanek@yahoo.com" => "10011",
      "fiona.sana@gmail.com" => "11580",
      "mstines007@icloud.com" => "10018",
      "aguptaus@gmail.com" => "10028",
      "kguptaus@gmail.com" => "10028",
      "runwithbooks@gmail.com" => "11209",
      "acmawji888@yahoo.com" => "10128",
      "scheng161@gmail.com" => "10128",
      "amdargan@gmail.com" => "10128",
      "cricky@flatironschool.com" => "10012",
      "isabellagamboa@gmail.com" => "10024",
      "ecarey@deloitte.com" => "10019",
      "pgcarey@aol.com" => "60045",
      "ajax461@yahoo.com" => "44236",
      "sahrsingh@yahoo.com" => "10029",
      "taylor@flatironschool.com" => "75230",
      "nehagnagpal@gmail.com" => "10028",
      "drmcclure2017@grsu14.org" => "04071",
      "dsyoung2017@grsu14.org" => "04071"
      }
    
  end
  
  def send_daily_email
    @users.each do |email, zipcode|
      
      @gif = Giphy.random(tag='puppy').image_original_url

      client = WeatherUnderground::Base.new
      result = client.SimpleForecast( zipcode )
      @weather_conditions = result.days[0].conditions
      @weather_high = result.days[0].high.fahrenheit
      @weather_low = result.days[0].low.fahrenheit

      url = open('http://api.nytimes.com/svc/topstories/v1/home.json?api-key=1bc209243e9293d196158d94ac2c3bf3:12:72378428')
      results_hash = JSON.load(open(url))
      @url1 = results_hash["results"][0]["url"] 
      @headline1 = results_hash["results"][0]["title"]
      @abstract1 = results_hash["results"][0]["abstract"]   
      @url2 = results_hash["results"][1]["url"] 
      @headline2 = results_hash["results"][1]["title"]
      @abstract2 = results_hash["results"][1]["abstract"] 
      @url3 = results_hash["results"][2]["url"] 
      @headline3 = results_hash["results"][2]["title"]
      @abstract3 = results_hash["results"][2]["abstract"]
      @url4 = results_hash["results"][3]["url"] 
      @headline4 = results_hash["results"][3]["title"]
      @abstract4 = results_hash["results"][3]["abstract"]
      @url5 = results_hash["results"][4]["url"] 
      @headline5 = results_hash["results"][4]["title"]
      @abstract5 = results_hash["results"][4]["abstract"]

      RestClient.post "https://api:key-b3c3fcdb51c644397a7748c033c1c804"\
        "@api.mailgun.net/v3/the-daily-update.com/messages",
      :from => "The Daily Update <postmaster@the-daily-update.com>",
      :to => email, 
      :subject => "Your Daily Update",
      :html => "<html><head>
<body style=
  'text-align: center;font-family: baskerville;color: #000000'>
</head>
<body>
<img src=#{@gif}> 
<h2>Today's Weather:</h2>
<h3>Today's weather conditions: #{@weather_conditions}.
The high temperature for today: #{@weather_high} degrees Fahrenheit.
The low temperature for today: #{@weather_low} degrees Fahrenheit.</h3>
<h2>Today's Headlines:</h2>
<h3>#{@headline1}</h3> 
<h4>#{@abstract1}</h4> 
View the full article here: #{@url1} 
<h3>#{@headline2}</h3> 
<h4>#{@abstract2}</h4> 
View the full article here: #{@url2}
<h3>#{@headline3}</h3> 
<h4>#{@abstract3}</h4> 
View the full article here: #{@url3}
<h3>#{@headline4}</h3> 
<h4>#{@abstract4}</h4> 
View the full article here: #{@url4}
<h3>#{@headline5}</h3> 
<h4>#{@abstract5}</h4> 
View the full article here: #{@url5}
<br>
<h5>The puppy gif is from Giphy. The weather information is from the Weather Underground Database. The news update is from the New York Times.</h5>
<h5>Brought to you by The Daily Update. To unsubscribe, follow the link on <a href = 'http://the-daily-update.herokuapp.com/unsubscribe_page'>The Daily Update's website.</a></h5>
</body></html>" 
      
    end   
  end
end
