# frozen_string_literal: true

class Property < ApplicationRecord
  validates :name, presence: true
  validates :user, presence: true
  validates :frequency, presence: true

  enum frequency: %i(weekly quarterly seasonal annual)
  belongs_to :user
end
