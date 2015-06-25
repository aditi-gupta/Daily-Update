require "rest-client"
require 'giphy'
require 'pry'

class DailyEmail
  def initialize
    @emails = ["arushigupta101@gmail.com", "aditi100gupta@gmail.com"]
  end
  def send_daily_email
    @gif = Giphy.random(tag='puppy').image_original_url
    
    @emails.each do |email|
      RestClient.post "https://api:key-3f0bf97cdc41cba9bb58712d34992b25"\
    "@api.mailgun.net/v3/sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org/messages",
      :from => "Mailgun Sandbox <postmaster@sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org>",
      :to => email, 
      :subject => "Your Daily Update",
      :html => "<html><img src=#{@gif}> <h3>This is your daily stuff. Brought to you by the Daily Update.</h3></html>" 
      #:text =>  
      
    end
    
    binding.pry
  end
end

test_email = DailyEmail.new
test_email.send_daily_email