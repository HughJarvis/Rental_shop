require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/vehicle.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/rental.rb' )
also_reload( '../models/*' )

#I think first four gets will use same erb file
#- functions determine which vehicles are displayed

get '/vehicles' do
  @vehicles = Vehicle.all()
  @categories = Vehicle.categories()
  erb( :"vehicles/index")
end

get '/vehicles/rented' do
  @vehicles = Vehicle.rented
  @categories = Vehicle.categories()
  erb( :"vehicles/index" )
end

get '/vehicles/available' do
  @vehicles = Vehicle.available
  @categories = Vehicle.categories()
  erb( :"vehicles/index")
end

get '/vehicles/filter/:category' do
  @vehicles = Vehicle.type(params[:category])
  @categories = Vehicle.categories()
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

get '/vehicles/:id' do
  @vehicle = Vehicle.find(params[:id])
  erb( :"vehicles/show")
end



get '/vehicles/:id/edit' do
  @vehicle = Vehicle.find(params[:id])
  erb( :"vehicles/edit")
end

post '/vehicles/:id' do
  @vehicle = Vehicle.new(params)
  @vehicle.update()
  redirect to '/vehicles'
end

get '/vehicles/:id/rent' do
  @vehicle = Vehicle.find(params[:id])
  @customers = Customer.all()
  erb(:"vehicles/rent")
end

post '/vehicles/:id/rent' do
  rental = Rental.new({
    'customer_id' => params[:customer_id],
    'vehicle_id' => params[:id]
    })
  rental.save()
  vehicle = Vehicle.find(params[:id])
  vehicle.check_out()
  redirect to '/rentals'
end

post '/vehicles/:id/check-in' do
  vehicle = Vehicle.find(params[:id])
  vehicle.check_in()
  redirect to '/vehicles'
end

post '/vehicles/:id/delete' do
  @vehicle = Vehicle.find(params[:id])
  @vehicle.delete()
  redirect to '/vehicles'
end
