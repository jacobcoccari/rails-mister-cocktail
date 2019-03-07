# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'open-uri'
require 'json'

Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
response = open(url)
ing_array = JSON.parse(response.read)["drinks"]
ing_array.each { |ingredient| Ingredient.create(name: ingredient["strIngredient1"])}

url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"
response = open(url)
drinks_array = JSON.parse(response.read)["drinks"]
doses_parts = [1,2,3,4]

drinks_array.each do |drink|
  cocktail = Cocktail.create(name: drink["strDrink"])
  4.times do
    Dose.create(description: doses_parts.sample, ingredient: Ingredient.all.sample(1), cocktail: cocktail)
  end
end


#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
