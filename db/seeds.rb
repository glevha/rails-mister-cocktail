require 'open-uri'
require 'json'

url_ingredients = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url_ingredients).read)

Ingredient.destroy_all

ingredients["drinks"].each do |ingredient|
	Ingredient.create!(name: ingredient["strIngredient1"].to_s)
end

Cocktail.destroy_all

url_cocktails = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
cocktails = JSON.parse(open(url_cocktails).read)

cocktails["drinks"].each do |cocktail|
	Cocktail.create!(name: cocktail["strDrink"].to_s, image: cocktail["strDrinkThumb"].to_s)
end
