require_relative( '../db/sql_runner' )

class Rental

  attr_reader :id, :customer_id, :vehicle_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @vehicle_id = options['vehicle_id']
  end

  def save()
    sql = "INSERT INTO rentals (customer_id, vehicle_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @vehicle_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Rental.all()
    sql = "SELECT * FROM rentals"
    results = SqlRunner.run(sql)
    return results.map{ |rental| Rental.new(rental) }
  end


end