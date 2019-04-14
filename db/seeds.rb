require_relative( "../models/vehicle.rb" )
require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require("pry-byebug")


vehicle1 = Vehicle.new({
    'name' => 'KITT',
    'category' => 'screen_stars',
    'on_hire' => 'false',
    'image'=> 'KITT.jpeg'
  })

  vehicle1.save()

vehicle2 = Vehicle.new({
      'name' => 'tank',
      'category' => 'military',
      'on_hire' => 'false',
      'image'=> 'tank.jpeg'
    })

  vehicle2.save()

vehicle3 = Vehicle.new({
      'name' => 'crane',
      'category' => 'heavy_plant',
      'on_hire' => 'false',
      'image'=> 'crane.jpg'
    })

vehicle3.save()

vehicle4 = Vehicle.new({
      'name' => 'penny_farthing',
      'category' => 'circus',
      'on_hire' => 'true',
      'image'=> 'penny_farthing.jpg'
    })

vehicle4.save()

vehicle5 = Vehicle.new({
      'name' => 'Blue Thunder',
      'category' => 'screen_stars',
      'on_hire' => 'true',
      'image' => 'blue_thunder.jpeg'
  })

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

rental1 = Rental.new({
  'customer_id' => customer1.id,
  'vehicle_id' => vehicle3.id
  })

rental1.save

binding.pry
nil
