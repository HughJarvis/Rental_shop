require_relative( '../db/sql_runner' )


class Vehicle

  attr_reader :id, :name, :category, :on_hire, :image

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
    @on_hire = options['on_hire']
    @image = options['image']
  end


  def save()
    sql = "INSERT INTO vehicles (name, category, on_hire, image) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @category, @on_hire, @image]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Vehicle.all()
    sql = "SELECT * FROM vehicles"
    results = SqlRunner.run(sql)
    return results.map{ |vehicle| Vehicle.new(vehicle) }
  end

  def Vehicle.find(id)
    sql = "SELECT * FROM vehicles WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Vehicle.new(result)
  end

  #define function to return all vehicles of given category
  def Vehicle.category(category)
    sql = "SELECT * FROM vehicles WHERE category = $1"
    values = [category]
    results = SqlRunner.run(sql, values)
    return results.map{ |vehicle| Vehicle.new(vehicle) }
  end

#function to return all vehicles on hire
  def Vehicle.rented()
    sql = "SELECT * FROM vehicles WHERE on_hire = $1"
    values = ["true"]
    results = SqlRunner.run(sql, values)
    return results.map{ |vehicle| Vehicle.new(vehicle) }
  end

#Function to return all vehicles available for rent
  def Vehicle.available()
    sql = "SELECT * FROM vehicles WHERE on_hire = $1"
    values = ["false"]
    results = SqlRunner.run(sql, values)
    return results.map{ |vehicle| Vehicle.new(vehicle) }
  end

  def delete()
    sql = "DELETE * FROM vehicles WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE vehicles SET (name, category, on_hire, image) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @category, @on_hire, @image, @id]
    SqlRunner.run(sql, values)
  end

  def check_out()
    sql = "UPDATE vehicles SET on_hire = $1 WHERE id = $2"
    values = ["true", @id]
    SqlRunner.run(sql, values)
  end

  def check_in()
    sql = "UPDATE vehicles SET on_hire = $1 WHERE id = $2"
    values = ["false", @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM vehicles WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE vehicles SET (name, category, on_hire, image) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @category, @on_hire, @image, @id]
    SqlRunner.run(sql, values)
  end

  def check_out()
    sql = "UPDATE vehicles SET on_hire = $1 WHERE id = $2"
    values = ["true", @id]
    SqlRunner.run(sql, values)
  end

  def check_in()
    sql = "UPDATE vehicles SET on_hire = $1 WHERE id = $2"
    values = ["false", @id]
    SqlRunner.run(sql, values)
  end

  #define function to assign vehicle to a customer (i.e create a new rental)
  def rent(customer)
    new_rental = Rental.new({
        'customer_id' => customer.id,
        'vehicle_id' => @id
      })
    new_rental.save()
    return new_rental
    end



end
