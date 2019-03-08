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
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    # @ingredients = @cocktail.find_dose_ingredient
    @dose = Dose.new
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
