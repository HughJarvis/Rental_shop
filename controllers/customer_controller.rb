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

post '/customers/:id' do
  @customer = Customer.new(params)
  @customer.update()
  redirect to '/customers'
end


get '/customers/:id/rent' do
  @customer = Customer.find(params[:id])
  @vehicles = Vehicle.available()
  erb(:"customers/rent")
end

get '/customers/:id/rentals' do
  @customer = Customer.find(params[:id])
  @rentals = @customer.rentals
  erb (:"customers/rentals")
end


post '/customers/:id/rent' do
  rental = Rental.new({
            'customer_id' => params[:id],
            'vehicle_id' => params[:vehicle_id]
            })
  rental.save()
  vehicle = Vehicle.find(params[:vehicle_id])
  vehicle.check_out()
  redirect to '/rentals'
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
