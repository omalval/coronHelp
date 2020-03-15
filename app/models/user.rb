class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :gardes, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :booked_reservations, through: :reservations, source: :gardes

  validates :username, presence: true
end
