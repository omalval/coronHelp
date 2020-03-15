class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :garde

  validates :reservation_quantity, presence: true, numericality: { only_integer: true }
  validates :pick_up_date, presence: true
end
