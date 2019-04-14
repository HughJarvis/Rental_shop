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
