class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @cocktails
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @restaurat.save
      redirect_to restaurant_path(@cocktail)
    else
      render "new"
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Cocktail.find_dose_ingredients
  end
end
