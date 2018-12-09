require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/game.rb')
also_reload('../models/*')

get '/games' do
  @games = Game.all
  erb(:"games/index")
end

get '/games/new' do
  @games = Game.all
  @publishers = Publisher.all
  @genres = ['Action', 'Adventure', 'Fighting', 'Platform', 'Puzzle', 'Racing', 'Role-playing', 'Shooter', 'Simulation', 'Sport', 'Strategy', 'Misc']
  erb(:"games/new")
end

get '/games/:id' do
  @game = Game.find(params[:id].to_i())
  erb(:"games/show")
end

post '/games' do
  game = Game.new(params)
  game.save
  redirect to('/games')
end

get '/games/:id/edit' do
  @game = Game.find(params[:id])
  @publishers = Publisher.all
  @genres = ['Action', 'Adventure', 'Fighting', 'Platform', 'Puzzle', 'Racing', 'Role-playing', 'Shooter', 'Simulation', 'Sport', 'Strategy', 'Misc']
  erb(:"games/edit")
end

get 'games/:publisher_id' do
  @games = Game.game_publisher(params[:publisher_id])
  erb(:"games/filter_publisher")
end

post '/games/:id' do
  @game = Game.new(params)
  @game.update
  redirect to("/games/#{params[:id]}")
end

post '/games/:id/delete' do
  games = Game.find(params[:id])
  games.delete()
  redirect to('/games')
end
