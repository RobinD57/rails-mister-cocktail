class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :ingredient, uniqueness: { scope: :cocktail_id }, presence: true
  validates :cocktail, presence: true
end
