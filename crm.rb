require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/contacts' do
  # create an instance variable containing a collection of all the contacts in your database.
  @contacts = Contact.all
  # passing all the data
  erb :contacts
end


# get '/about' do
#   @title = 'About Us'
#   erb :about
# end

after do
  ActiveRecord::Base.connection.close
end
