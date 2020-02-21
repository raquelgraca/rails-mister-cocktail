# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

puts 'Cleaning database'
Ingredient.destroy_all

puts 'Creating ingredients'

ingredient_list = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ing = JSON.parse(ingredient_list)

ing['drinks'].each do |i|
  Ingredient.create(name: i['strIngredient1'])
end
puts 'Ingredients created!'

25.times do
  Ingredient.create!(name: Faker::Food.spice)
end

puts 'some spices!'
