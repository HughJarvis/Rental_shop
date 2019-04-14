require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/vehicle.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/rental.rb' )
also_reload( '../models/*' )

#I think first three gets will use same erb file
#- functions determine which vehicles are displayed

get '/vehicles' do
  @vehicles = Vehicle.all
  erb( :"vehicles/index")
end

get '/vehicles/rented' do
  @vehicles = Vehicle.rented
  erb( :"vehicles/index" )
end

get '/vehicles/available' do
  @vehicles = Vehicle.available
  erb( :"vehicles/index")
end

get '/vehicles/new' do
  erb( :"vehicles/new")
end

post '/vehicles' do
  vehicle = Vehicle.new(params)
  vehicle.save
  redirect to '/vehicles'
end

get '/vehicles/:id/edit' do
  @vehicle = Vehicle.find(params[:id])
  erb( :"vehicles/edit")
end

post '/vehicles/:id' do
  @vehicle.update(params[:id])
  redirect to '/vehicles'
end
