require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/vehicle.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/rental.rb' )
also_reload( '../models/*' )


get '/customers' do
  @customers = Customer.all
  erb( :"customers/index")
end

get '/customers/new' do
  erb(:"customers/new")
end

get '/customers/:id' do
  @customer = Customer.find(params[:id])
  erb(:"customers/show")
end

get '/customers/:id/edit' do
  @customer = Customer.find(params[:id])
  erb(:"customers/edit")
end

get '/customers/:id/rent' do
  @customer = Customer.find(params[:id])
  @vehicles = Vehicle.all()
  erb(:"customers/rent")
end

post '/customers' do
  customer = Customer.new(params)
  customer.save()
  redirect to '/customers'
end

post '/customers/:id/delete' do
  customer = Customer.find(params[:id])
  customer.delete()
  redirect to '/customers'
end
