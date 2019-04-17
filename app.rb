require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('controllers/vehicle_controller')
require_relative('controllers/customer_controller')
require_relative('controllers/rental_controller')



get '/' do
  @available_vehicles = Vehicle.available()
  @vehicles_on_hire = Vehicle.rented()
  erb( :index)
end
