require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/publisher.rb')
also_reload('../models/*')

get '/publishers' do
  @publishers = Publisher.all
  erb(:"publishers/index")
end

get '/publishers/new' do
  @publisher = Publisher.all
  erb(:"publishers/new")
end

post '/publishers' do
  publisher = Publisher.new(params)
  publisher.save
  redirect to('/publishers')
end
