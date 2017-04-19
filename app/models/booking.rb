class Booking < ApplicationRecord

  validates :property_id, presence: true
  validates :contact_id, presence: true

  belongs_to :property, inverse_of: :bookings
  belongs_to :contact, inverse_of: :bookings
end