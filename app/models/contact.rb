class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :bookings, inverse_of: :contact

  def full_name
    [first_name, last_name].compact.join ' '
  end
end