class User < ApplicationRecord
  ROLES = %w(user admin).freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :mail_handle, presence: true, uniqueness: true

  validates :role, presence: true, inclusion: { in: ROLES }

  before_save :generate_mail_handle, unless: :mail_handle

  has_many :properties, inverse_of: :user

  before_validation do
    self.role ||= :user
  end

  def full_name
    [first_name, last_name].compact.join ' '
  end

  def admin?
    role == 'admin'
  end

  def generate_mail_handle
    self.mail_handle = SecureRandom.hex(10)
  end

  def sendgrid_email_address
    return unless mail_handle && ENV['sendgrid_mail_domain']
    mail_handle + '@' + ENV['sendgrid_mail_domain']
  end
end
