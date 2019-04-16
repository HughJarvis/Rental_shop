require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('controllers/vehicle_controller')
require_relative('controllers/customer_controller')
require_relative('controllers/rental_controller')



get '/' do
  erb( :index)
end
