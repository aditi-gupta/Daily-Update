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
      "mstines007@icloud.com" => "10018",
      "aguptaus@gmail.com" => "10028",
      "kguptaus@gmail.com" => "10028",
      "acmawji888@yahoo.com" => "10128",
      "cricky@flatironschool.com" => "10012",
      "isabellagamboa@gmail.com" => "10024",
      "sahrsingh@yahoo.com" => "10029",
      "taylor@flatironschool.com" => "75230",
      "mkyi@brearley.org" => "10028",
      "cnilssonsalvati@brearley.org" => "11101",
      "chloestingray@gmail.com" => "10021",
      "adamtornado@gmail.com" => "10021",
      "pwhitehouse@brearley.org" => "10128",
      "katherinehatfield2@gmail.com" => "10024",
      "reenagupta104@gmail.com" => "30097",
      "ambaiv04@gmail.com" => "30022",
      "itad1099@gmail.com" => "10023",
      "potatoeypot@gmail.com" => "10024",
      "kzelbo@brearley.org" => "10024",
      "kzelbo@nyc.rr.com" => "10024",
      "kgillman@brearley.org" => "10028",
      "gabriellerich@gmail.com" => "10075",
      "coolbeanz321@gmail.com" => "10128",
      "gaoyusi0206@gmail.com" => "10028",
      "jmulkin@brearley.org" => "10028",
      "bruskin777@gmail.com" => "10023",
      "ajfried2002@gmail.com" => "10022",
      "pinkpiano2000@gmail.com" => "10023",
      "beatrixspade@icloud.com" => "10075",
      "lloydplenty@msn.com" => "10028",
      "mkeppler@live.com" => "10019",
      "dglick@brearley.org" => "10021",
      "christine_yang7@yahoo.com" => "10021",
      "orlandoclay@gmail.com" => "10280",
      "horatiohamkins@hunterschools.org" => "10022"
      }
    
  end
  
  def send_daily_email
    @users.each do |email, zipcode|
      
      @gif = Giphy.random('puppy').image_original_url

      client = WeatherUnderground::Base.new
      result = client.SimpleForecast( zipcode )
      @weather_conditions = result.days[0].conditions
      @weather_high = result.days[0].high.fahrenheit
      @weather_low = result.days[0].low.fahrenheit

      url = open('http://api.nytimes.com/svc/topstories/v2/home.json?api-key=1bc209243e9293d196158d94ac2c3bf3:12:72378428')
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

      RestClient.post "https://api:key-262705a09683f8559057c6173150718c"\
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
<h3>Today's weather conditions: #{@weather_conditions}.</h3>
<h3>The high temperature for today: #{@weather_high} degrees Fahrenheit.</h3>
<h3>The low temperature for today: #{@weather_low} degrees Fahrenheit.</h3>
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
<h5>Please feel free to contact us with questions, comments, concerns, compliments (!), and anything else you can think of at founders@the-daily-update.com. We love hearing from you!</h5>
The puppy gif is from Giphy. The weather information is from the Weather Underground Database. The news update is from the New York Times.
<br>
Brought to you by The Daily Update. To unsubscribe, follow the link on <a href = 'http://the-daily-update.herokuapp.com/unsubscribe_page'>The Daily Update's website.</a>
<br>
</body></html>" 
      
    end   
  end
end
