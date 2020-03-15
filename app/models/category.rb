class Category < ApplicationRecord
  has_many :garde_categories
  has_many :gardes, through: :garde_categories
end
