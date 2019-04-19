require_relative( '../db/sql_runner' )

class Rental

  attr_reader :id, :customer_id, :vehicle_id, :status

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @vehicle_id = options['vehicle_id']
    @status = options['status']
  end

  def save()
    sql = "INSERT INTO rentals (customer_id, vehicle_id, status)
          VALUES ($1, $2, $3) RETURNING id"
    values = [@customer_id, @vehicle_id, @status]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Rental.all()
    sql = "SELECT * FROM rentals"
    results = SqlRunner.run(sql)
    return results.map{ |rental| Rental.new(rental) }
  end

#returns customer for a given rental
  def customer()
    sql = "SELECT * FROM customers INNER JOIN rentals ON rentals.customer_id
          = customers.id WHERE rentals.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)[0]
    return Customer.new(result)
  end

#returns vehicle for a given rental
  def vehicle()
    sql = "SELECT * FROM vehicles INNER JOIN rentals ON rentals.vehicle_id
          = vehicles.id WHERE rentals.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)[0]
    return Vehicle.new(result)
  end

  #return rentals of a given  vehicle category
  def Rental.type(category)
    sql = "SELECT * FROM rentals INNER JOIN vehicles ON vehicles.id
          = rentals.vehicle_id WHERE vehicles.category = $1 ORDER BY vehicles.name ASC"
    values = [category]
    results = SqlRunner.run(sql, values)
    return results.map{ |rental| Rental.new(rental) }
  end

  #changes rental status from on_hire to returned
  def returned()
    sql = "UPDATE rentals SET status = $1 WHERE id = $2"
    values = ['returned', @id]
    SqlRunner.run(sql, values)
  end
end
