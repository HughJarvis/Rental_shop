require_relative( "../models/vehicle.rb" )
require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require("pry-byebug")


vehicle1 = Vehicle.new({
    'name' => 'KITT',
    'category' => 'screen_stars',
    'on_hire' => 'false',
    'image'=> 'KITT.jpg'
  })

  vehicle1.save()

vehicle2 = Vehicle.new({
      'name' => 'Tank',
      'category' => 'military',
      'on_hire' => 'false',
      'image'=> 'tank.jpeg'
    })

  vehicle2.save()

vehicle3 = Vehicle.new({
      'name' => 'Crane',
      'category' => 'heavy_plant',
      'on_hire' => 'true',
      'image'=> 'crane.jpg'
    })

vehicle3.save()

vehicle4 = Vehicle.new({
      'name' => 'Penny Farthing',
      'category' => 'circus',
      'on_hire' => 'false',
      'image'=> 'penny_farthing.jpg'
    })

vehicle4.save()

vehicle5 = Vehicle.new({
      'name' => 'Bulldozer',
      'category' => 'heavy_plant',
      'on_hire' => 'true',
      'image' => 'bulldozer.jpeg'
  })

vehicle5.save()

vehicle6 = Vehicle.new({
      'name' => 'Velocipede',
      'category' => 'circus',
      'on_hire' => 'false',
      'image' => 'velocipede.jpg'
  })

vehicle6.save()

vehicle7 = Vehicle.new({
      'name' => 'Airwolf',
      'category' => 'circus',
      'on_hire' => 'false',
      'image' => 'airwolf.jpg'
  })

vehicle7.save()




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

customer5 = Customer.new({
  'first_name' => 'Eugene',
  'second_name' => 'Kelly'
  })

customer5.save()

customer6 = Customer.new({
  'first_name' => 'Charlie',
  'second_name' => 'Reid'
  })

customer6.save()

customer7 = Customer.new({
  'first_name' => 'Mary',
  'second_name' => 'Marquis'
  })

customer7.save()


rental1 = Rental.new({
  'customer_id' => customer1.id,
  'vehicle_id' => vehicle3.id
  })

rental1.save

rental2 = Rental.new({
  'customer_id' => customer2.id,
  'vehicle_id' => vehicle5.id
  })

rental2.save

binding.pry
nil
