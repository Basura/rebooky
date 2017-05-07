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
  validates :mail_handle, presence: true, uniqueness: true

  enum frequency: %i(weekly quarterly seasonal annual)
  enum home_type: %i(condo chalet town-home house beach-house)
  enum recreational_type: { ski: 1, beach: 2, adventure: 3, hostel: 4, cabin: 5 }

  before_save :generate_mail_handle, unless: :mail_handle

  belongs_to :user
  has_and_belongs_to_many :peak_seasons, inverse_of: :property
  has_many :bookings, inverse_of: :property

  def sendgrid_email_address
    return unless mail_handle && ENV['sendgrid_mail_domain']
    mail_handle + '@' + ENV['sendgrid_mail_domain']
  end

  def generate_mail_handle
    self.mail_handle = SecureRandom.hex(10)
  end
end
