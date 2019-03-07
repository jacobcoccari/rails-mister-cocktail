class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    # @ingredients = []
    # Ingredient.all.each { |ingredient| @ingredients << ingredient.name }
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def delete

  end

  private
  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
