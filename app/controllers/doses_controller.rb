class DosesController < ApplicationController
	before_action :set_dose, only: :new
	before_action :set_cocktail, only: :create
	before_action :set_ingredient, only: :create

	def new
		@dose = Dose.new
	end

	def create
		@dose = Dose.new(dose_params)
		@ingredients = Ingredient.all.map { |ing| ing.name } 
		@dose.cocktail = @cocktail
		@dose.ingredient = @ingredient
		if @dose.save
  		redirect_to cocktail_path(@cocktail)
  	else
  		render :new
  	end
	end

	private

	def set_dose
		@dose = Dose.find(params[:id])
	end

	def set_cocktail
		@cocktail = Cocktail.find(params[:cocktail_id])
	end

	def set_ingredient
		@ingredient = Ingredient.find_by_name(params[:ingredient])
	end

	def dose_params
		params.require(:dose).permit(:description)
	end
end
