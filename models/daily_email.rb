require "rest-client"

class DailyEmail
  def initialize
    @emails = ["arushigupta101@gmail.com", "aditi100gupta@gmail.com"]
  end
  def send_daily_email
    @emails.each do |email|
      RestClient.post "https://api:key-3f0bf97cdc41cba9bb58712d34992b25"\
    "@api.mailgun.net/v3/sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org/messages",
      :from => "Mailgun Sandbox <postmaster@sandboxd0e86587ad9f4ec8845133e378927022.mailgun.org>",
      :to => email, 
      :subject => "Your Daily Update",
      :text => "This is your daily stuff. Brought to you by the Daily Update."
    end
  end
end