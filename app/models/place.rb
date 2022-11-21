class Place < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: %w(House Mansion Boat Limo Castle Island Other )}
  validates :description, presence: true, length: { minimum: 20 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_tan: 5 }
  validates :location, presence: true
  validates :price, presence: true
end
