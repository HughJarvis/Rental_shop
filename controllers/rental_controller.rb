require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/vehicle.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/rental.rb' )
also_reload( '../models/*' )

get '/rentals' do
  @rentals = Rental.all()
  erb (:"rentals/index")
end

get '/rentals/new' do
  @vehicles = Vehicle.available()
  @customers = Customer.all()
  erb (:"rentals/new")
end

post '/rentals/new' do
  rental = Rental.new({
            'customer_id' => params[:customer_id],
            'vehicle_id' => params[:vehicle_id]
            })
  rental.save()
  vehicle = Vehicle.find(params[:vehicle_id])
  vehicle.check_out()
  redirect to '/rentals'
end
