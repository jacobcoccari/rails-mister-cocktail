class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true
  validates_uniqueness_of :name

  def self.find_dose_ingredients
    array = []
    self.doses.each do |dose|
      helper_array = []
      ingredient = Ingredient.find_dose_ingredient_by_id(dose[:ingredient_id])
      helper_array[0] = ingredient
      helper_array[1] = dose
      array << helper_array
    end
  end
end
