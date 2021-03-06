# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "rest-client"
require 'open-uri'

Ingredient.delete_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = RestClient.get(url)
results = JSON.parse(response)
ingredients = results['drinks']

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

=begin
Cocktail.delete_all

url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
cocktail_serialized = open(url).read
cocktails = JSON.parse(cocktail_serialized)

cocktails["drinks"].each do |drink|
  Cocktail.create(
    name: drink["strDrink"],
    photo: drink["strDrinkThumb"]
  )
end
=end
