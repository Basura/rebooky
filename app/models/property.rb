# frozen_string_literal: true

class Property < ApplicationRecord
  validates :user, presence: true
  validates :frequency, presence: true
  validates :title, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :bedrooms, presence: true
  validates :sleeps, presence: true
  validates :home_type, presence: true

  enum frequency: %i(weekly quarterly seasonal annual)
  enum home_type: %i(condo chalet town-home house beach-house)
  enum recreational_type: { ski: 1, beach: 2, adventure: 3, hostel: 4, cabin: 5 }

  belongs_to :user
  has_and_belongs_to_many :peak_seasons, inverse_of: :property
end
