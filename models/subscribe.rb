require "rest-client"

class Subscriber 
  attr_accessor :subscriber_email
  
  def initialize(subscriber_email)
    @subscriber_email = subscriber_email
  end
  def send_subscriber_message
    RestClient.post "https://api:key-3f0bf97cdc41cba9bb58712d34992b25"\
  "@api.mailgun.net/v3/sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org/messages",
    :from => "Mailgun Sandbox <postmaster@sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org>",
    :to => "Arushi and Aditi <arushigupta101@gmail.com>", 
    :subject => "New Subscriber",
    :text => "You have a new subscriber to add to the list for the Daily Update. Their email is: #{subscriber_email}"
  end
end