require "rest-client"

class Unsubscriber 
  attr_accessor :unsubscriber_email
  
  def initialize(unsubscriber_email)
    @unsubscriber_email = unsubscriber_email
    @our_emails = ["arushigupta101@gmail.com", "aditi100gupta@gmail.com"]
  end
  def send_unsubscriber_message
    @our_emails.each do |my_email|
      RestClient.post "https://api:key-b3c3fcdb51c644397a7748c033c1c804"\
    "@api.mailgun.net/v3/sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org/messages",
      :from => "Mailgun Sandbox <postmaster@sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org>",
      :to => my_email, 
      :subject => "Unsubscriber",
      :text => "The user with the email #{unsubscriber_email} would like to unsubscribe from the Daily Update service. Please take them out of the array of subscribers."
    end
  end
end
