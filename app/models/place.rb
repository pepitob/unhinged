class Place < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: %w(House Mansion Boat Limo Castle Island Other )}
  validates :description, presence: true, length: { minimum: 20 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_tan: 5 }
  validates :location, presence: true
  validates :price, presence: true
end
