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
      RestClient.post "https://api:key-a16cd16a87d93b2c72100c8dfc9a86a3"\
    "@api.mailgun.net/v3/the-daily-update.com/messages",
      :from => "The Daily Update <postmaster@the-daily-update.com>",
      :to => my_email, 
      :subject => "New Subscriber",
      :text => "You have a new subscriber to add to the list for the Daily Update. Their email is: #{subscriber_email}. Their zip code is #{zipcode}"
    end
  end
end
