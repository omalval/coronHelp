class Garde < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :clients_users, through: :reservations, source: :user
  has_many :garde_categories, dependent: :destroy
  has_many :categories, through: :garde_categories
  # has_many :reviews




  CATEGORIES = ["Garde d'enfant", "Courses", "Aide aux devoirs", "Aide aux personnes âgées"]

  # pg_search_scope :global_search,
  #   against: [ :name, :description, :category ],
  #   associated_against: {
  #     user: [ :username]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }


  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :contact, presence: true

  # validates :quantity_max, presence: true, numericality: { only_integer: true }
  # validates :start_availability_date, presence: true
  # validates :end_availability_date, presence: true
  # mount_uploader :photo, PhotoUploader


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # def can_delete?
  #   !self.reservations.pluck(:status).include?('accepted')
  # end

  # def left_quantity
  #   if !can_delete?
  #     self.quantity_max - self.reservations.where(status: "accepted").pluck(:reservation_quantity).reduce(:+)
  #   else
  #     self.quantity_max
  #   end
  # end

  # def rating_average
  #   self.reviews.map { |review| review.rating }.reduce(:+) / self.reviews.count.to_f
  # end
end
