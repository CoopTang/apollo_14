# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

neil  = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
bob   = Astronaut.create(name: "Bob Joe", age: 20, job: "Janitor")
frank = Astronaut.create(name: "Frank Sinatra", age: 33, job: "System Administrator")

apollo_14 = neil.missions.create(title: "Apollo 14", time_in_space: 150)
apollo_11 = neil.missions.create(title: "Apollo 11", time_in_space: 50)
