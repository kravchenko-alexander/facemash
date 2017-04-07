class Session < ApplicationRecord
  belongs_to :user, inverse_of: :sessions

  validates :access_token, presence: true, uniqueness: true
  validates :refresh_token, presence: true, uniqueness: true

  before_validation :set_access_token, :set_refresh_token

  private

  def set_access_token
    self.access_token = loop do
      random_token = SecureRandom.urlsafe_base64(64, false)
      break random_token unless Session.exists?(access_token: random_token)
    end
  end

  def set_refresh_token
    self.refresh_token = loop do
      random_token = SecureRandom.urlsafe_base64(64, false)
      break random_token unless Session.exists?(refresh_token: random_token)
    end
  end
end
