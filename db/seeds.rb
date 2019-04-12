require_relative( "../models/vehicle.rb" )
require_relative( "../models/customer.rb" )
#require_relative( "../models/rental.rb" )
require("pry-byebug")



vehicle1 = Vehicle.new({
    'name' => 'KITT',
    'category' => 'screen_stars',
    'on_hire' => 'false',
    'image'=> 'none'
  })

  vehicle1.save()

vehicle2 = Vehicle.new({
      'name' => 'tank',
      'category' => 'military',
      'on_hire' => 'false',
      'image'=> 'none'
    })

  vehicle2.save()

vehicle3 = Vehicle.new({
      'name' => 'crane',
      'category' => 'heavy_plant',
      'on_hire' => 'false',
      'image'=> 'none'
    })

vehicle3.save()

vehicle4 = Vehicle.new({
      'name' => 'penny_farthing',
      'category' => 'circus',
      'on_hire' => 'true',
      'image'=> 'none'
    })

vehicle4.save()

customer1 = Customer.new({
  'first_name' => 'Lorraine',
  'second_name' => 'Kelly'
  })

customer1.save()

customer2 = Customer.new({
  'first_name' => 'Ian',
  'second_name' => 'Tough'
  })

customer2.save()

customer3 = Customer.new({
  'first_name' => 'Andy',
  'second_name' => 'Murray'
  })

customer3.save()

customer4 = Customer.new({
  'first_name' => 'Francis',
  'second_name' => 'McKee'
  })

customer4.save()


binding.pry
nil
