class User < ApplicationRecord
  USER_TYPES = %w(Users::Admin Users::Moderator).freeze

  has_many :sessions, inverse_of: :user, dependent: :destroy

  validates :email, email: true, presence: true, uniqueness: true
  validates :type, presence: true, inclusion: { in: USER_TYPES }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_validation :email_downcase

  has_secure_password

  private

  def email_downcase
    email.downcase!
  end
end
