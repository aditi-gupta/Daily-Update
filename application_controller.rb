require 'bundler'
Bundler.require

require_relative 'models/subscribe.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/subscribe' do
    new_subscriber = params["subscriber_email"]
    subscriber_to_add = Subscriber.new(new_subscriber)
    subscriber_to_add.send_subscriber_message
    erb :thanks
  end

end