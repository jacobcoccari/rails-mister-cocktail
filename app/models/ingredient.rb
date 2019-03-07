class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true
  validates_uniqueness_of :name

  def self.find_dose_ingredient_by_id(id)
    return Ingredient.find(id)
  end
end
