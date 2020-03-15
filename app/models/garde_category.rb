class GardeCategory < ApplicationRecord
  belongs_to :garde
  belongs_to :category
  validates :garde, presence: true
  validates :category, presence: true
end
