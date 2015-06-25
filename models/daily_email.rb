require "rest-client"
require 'giphy'
require 'pry'
require 'json'
require 'open-uri'

class DailyEmail
  def initialize
    @emails = ["arushigupta101@gmail.com", "aditi100gupta@gmail.com"]
    
  end
  
  def send_daily_email
    @gif = Giphy.random(tag='puppy').image_original_url
    
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
      :subject => "Please say this has all the NYT stuff...",
      :html => "<html><img src=#{@gif}> 
<h3>#{@headline}</h3> 
<h6>#{@snippet}</h6> 
View the full article here:#{@url} 
<h3>This is your daily stuff. Brought to you by the Daily Update.</h3></html>" 
      
    end   
  end
end

test_email = DailyEmail.new
test_email.send_daily_email