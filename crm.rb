require_relative 'contact'
require 'sinatra'

get '/' do
  @contacts = Contact.all
  erb :index
end

get '/about' do
  erb :about
end

get '/contacts/new' do
  erb :new
end

get '/index' do

  erb :index
end

get '/contacts' do
  # create an instance variable containing a collection of all the contacts in your database.
  @contacts = Contact.all
  # passing all the data
  erb :contacts
end

get '/contacts/:id' do
  # params[:id] contains the id from the URL
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
