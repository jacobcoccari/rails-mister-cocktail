class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true
  validates_uniqueness_of :name

  def find_dose_ingredients
    array = []
    self.doses.each do |dose|
      helper_array = []
      ingredient = Ingredient.find_dose_ingredient_by_id(dose[:ingredient_id]).name
      helper_array[0] = ingredient
      helper_array[1] = dose.description
      array << helper_array
    end
    return array
  end
end
