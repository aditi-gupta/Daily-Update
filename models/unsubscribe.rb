require "rest-client"

class Unsubscriber 
  attr_accessor :unsubscriber_email
  
  def initialize(unsubscriber_email)
    @unsubscriber_email = unsubscriber_email
    @our_emails = ["arushigupta101@gmail.com", "aditi100gupta@gmail.com"]
  end
  def send_unsubscriber_message
    @our_emails.each do |my_email|
      RestClient.post "https://api:key-a16cd16a87d93b2c72100c8dfc9a86a3"\
    "@api.mailgun.net/v3/the-daily-update.com/messages",
      :from => "The Daily Update <postmaster@the-daily-update.com>",
      :to => my_email, 
      :subject => "Unsubscriber",
      :text => "The user with the email #{unsubscriber_email} would like to unsubscribe from the Daily Update service. Please take them out of the array of subscribers."
    end
  end
end
