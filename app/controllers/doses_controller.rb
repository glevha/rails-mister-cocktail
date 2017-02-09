class DosesController < ApplicationController
	before_action :set_cocktail, only: [:new, :create, :destroy]
	before_action :set_ingredient, only: :create
	before_action :set_dose, only: :destroy

	def new
		@dose = Dose.new
		@ingredients = Ingredient.all
	end

	def create
		@dose = Dose.new(dose_params)
		@dose.cocktail = @cocktail
		@dose.ingredient = @ingredient
		if @dose.save
  		redirect_to cocktail_path(@cocktail)
  	else
  		render :new
  	end
	end

	def destroy
		@dose.destroy
		redirect_to cocktail_path(@cocktail)
	end

	private

	def set_dose
		@dose = Dose.find(params[:id])
	end

	def set_cocktail
		@cocktail = Cocktail.find(params[:cocktail_id])
	end

	def set_ingredient
		params[:dose][:ingredient_id] == "" ? nil : @ingredient = Ingredient.find(params[:dose][:ingredient_id])
	end

	def dose_params
		params.require(:dose).permit(:description)
	end
end
