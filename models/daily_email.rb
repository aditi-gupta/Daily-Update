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
      @headline = response_hash 
    binding.pry
    
    
    @emails.each do |email|
      RestClient.post "https://api:key-3f0bf97cdc41cba9bb58712d34992b25"\
    "@api.mailgun.net/v3/sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org/messages",
      :from => "Mailgun Sandbox <postmaster@sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org>",
      :to => email, 
      :subject => "Your Daily Update",
      :html => "<html><img src=#{@gif}> #{@headline} <h3>This is your daily stuff. Brought to you by the Daily Update.</h3></html>" 
      #:text =>
      
    end 
    
    
  end
  
#   def api_call
#     @url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=8d4f4955fc1ec5ba9bb216928505e58b:18:71651992"
#       response_hash = JSON.load(open(@url))
#       @headline = response_hash
   
 
end

test_email = DailyEmail.new
test_email.send_daily_email
