require 'bundler'
Bundler.require

require_relative 'models/subscribe.rb'
require_relative 'models/unsubscribe.rb'

class MyApp < Sinatra::Base
  
  @@subscriber_to_add = nil

  get '/' do
    erb :index
  end
  
  post '/subscribe' do
    new_subscriber = params["subscriber_email"]
    @@subscriber_to_add = Subscriber.new(new_subscriber)
    erb :zipcode
  end
  
  post '/add_zipcode' do
    subscriber_zipcode = params["zipcode"]
    @@subscriber_to_add.zipcode=(subscriber_zipcode)
    @@subscriber_to_add.send_subscriber_message
    erb :add_zipcode
  end
  
  get '/unsubscribe_page' do
    erb :unsubscribe_page
  end
  
  post '/unsubscribe' do
    unsubscriber = params["unsubscriber_email"]
    subscriber_to_remove = Unsubscriber.new(unsubscriber)
    subscriber_to_remove.send_unsubscriber_message
    erb :confirmation
  end

end
