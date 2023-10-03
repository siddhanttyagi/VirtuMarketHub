# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Create dummy data for ratings
100.times do
    Rating.create(
      user_id: rand(1..50),              
      item_id: rand(10..20),            
      rating: rand(1..5)                
    )
  end
  