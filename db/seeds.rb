# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(first_name: 'Doctor', last_name: 'Rivera', email: 'test.avion.19@gmail.com', password: 'password', role: 1, age: 53)
User.create(first_name: 'Client', last_name: 'Rivera', email: 'frari2000@gmail.com.com', password: 'password', role: 0, age: 22)
