require_relative( '../db/sql_runner' )

class Customer

  attr_reader :id, :first_name, :second_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
  end


  def save()
    sql = "INSERT INTO customers (first_name, second_name)
          VALUES ($1, $2) RETURNING id"
    values = [@first_name, @second_name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Customer.all()
    sql = "SELECT * FROM customers ORDER BY second_name ASC"
    results = SqlRunner.run(sql)
    return results.map{ |customer| Customer.new(customer) }
  end

  def Customer.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Customer.new(result)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (first_name, second_name) = ($1, $2) WHERE id = $3"
    values = [@first_name, @second_name, @id]
    SqlRunner.run(sql, values)
  end

  def rentals()
    sql = "SELECT * FROM rentals WHERE customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{ |rental| Rental.new(rental) }
  end

  def vehicles()
    sql = "SELECT * FROM vehicles INNER JOIN rentals ON rentals.vehicle_id =
          vehicles.id WHERE rentals.customer_id = $1"
    values = [@id]
    resuls = SqlRunner.run(sql, values)
    return results.map{ |vehicle| Vehicle.new(vehicle) }
  end





end
