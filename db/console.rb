require_relative('../models/ticket')
require_relative('../models/film')
require_relative('../models/customer')

require('pry')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new( { 'name' => 'David', 'fund' => 10} )
customer1.save()
customer2 = Customer.new( { 'name' => 'Carrie', 'fund' => 6} )
customer2.save()
customer3 = Customer.new( { 'name' => 'Phillip', 'fund' => 8} )
customer3.save()


film1 = Film.new({ 'title' => 'Star Wars: The Last Jedi', 'price' => 4})
film1.save()
film2 = Film.new({ 'title' => 'Taken', 'price' => 3})
film2.save()
film3 = Film.new({ 'title' => 'Alice in Wonderland', 'price' => 2})
film3.save()


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()


binding.pry
nil
