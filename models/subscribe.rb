require "rest-client"

class Subscriber 
  attr_accessor :subscriber_email, :zipcode
  
  def initialize(subscriber_email)
    @subscriber_email = subscriber_email
    @our_emails = ["arushigupta101@gmail.com", "aditi100gupta@gmail.com"]
    @zipcode = zipcode
  end
  def send_subscriber_message
    @our_emails.each do |my_email|
      RestClient.post "https://api:key-3f0bf97cdc41cba9bb58712d34992b25"\
    "@api.mailgun.net/v3/sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org/messages",
      :from => "Mailgun Sandbox <postmaster@sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org>",
      :to => my_email, 
      :subject => "New Subscriber",
      :text => "You have a new subscriber to add to the list for the Daily Update. Their email is: #{subscriber_email}. Their zip code is #{zipcode}"
    end
  end
end