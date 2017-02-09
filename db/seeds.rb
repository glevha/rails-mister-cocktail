require 'open-uri'
require 'json'
	# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url_ingredients = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url_ingredients).read)

Ingredient.destroy_all

ingredients["drinks"].each do |ingredient|
	Ingredient.create!(name: ingredient["strIngredient1"].to_s)
end

url_cocktails = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
cocktails = JSON.parse(open(url_cocktails).read)

cocktails["drinks"].each do |cocktail|
	Cocktail.create!(name: cocktail["strDrink"].to_s)
end

