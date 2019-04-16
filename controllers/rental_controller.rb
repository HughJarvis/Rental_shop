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
  erb (:"rentals/new")
end
