require_relative("../db/sql_runner")


class Customer
  attr_reader :id
  attr_accessor :name, :fund

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @fund = options['fund'].to_i
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      fund
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @fund]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end


  def update()
    sql = "UPDATE customers SET (name, funds) =
    ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def buy_tickets()


  end


  def self.map_items(customer_hashes)
    result = customer_hashes.map{ |customer_hash|
      self.new(customer_hash)}
      return result
  end

  def films()
      sql = "SELECT films.* FROM films INNER JOIN
      tickets ON tickets.film_id =
      films.id WHERE tickets.customer_id = $1"
      values = [@id]
      film_hashes = SqlRunner.run(sql, values)
      return Film.map_items(film_hashes)
  end
    #CLASS METHOD
  def self.delete_all()
      sql = "DELETE FROM customers"
      SqlRunner.run(sql)
  end

  def self.all()
      sql = "SELECT * FROM customers"
      customer_hashes = SqlRunner.run(sql)
      return Customer.map_items(customer_hashes)
  end

end
