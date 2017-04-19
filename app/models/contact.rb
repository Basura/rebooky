class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :property_id, presence: true

  belongs_to :property, inverse_of: :contacts

  def full_name
    [first_name, last_name].compact.join ' '
  end
end