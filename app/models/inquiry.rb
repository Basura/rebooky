# frozen_string_literal: true

require 'mail'

class Inquiry < ApplicationRecord
  belongs_to :contact, autosave: true
  belongs_to :property

  store :message, accessors: %i(
    headers attachments html text subject
  ), coder: JSON

  validates :property, presence: true
  validates :contact, presence: true

  before_validation :find_property, :find_contact

  def from
    @from = Mail::Address.new(message['from'])
  end

  def to
    @to = Mail::Address.new(message['to'])
  end

  def valid_to_address?
    return if User.where(mail_handle: to.local).exist?
    errors.add :to, 'is not a registered email address'
  end

  def find_property
    vrbo_id = subject.gsub(/.*#([0-9]+)/, '\1')
    user = find_user
    return unless user.present?
    self.property = Property.joins(:property_externals)
                            .find_by(property_externals: {
                                       external_id: vrbo_id, entity: :vrbo
                                     })
  end

  def find_user
    User.find_by(mail_handle: to.local)
  end

  def find_contact
    contact = Contact.find_or_initialize_by(email: from.address.downcase)
    self.contact = contact.tap do |c|
      first_name, last_name = from.display_name.split(' ', 2)
      c.first_name ||= first_name
      c.last_name ||= last_name
    end
  end
end
