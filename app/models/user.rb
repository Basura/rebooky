class User < ApplicationRecord
  ROLES = %w(user admin).freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  validates :role, presence: true, inclusion: { in: ROLES }

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
end
