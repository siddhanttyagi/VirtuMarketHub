class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true
  validates :address, presence: true
  has_many :orders, dependent: :destroy
  validates :password_confirmation, presence: true
  validate :password_match
end

private

  def password_match
    if password != password_confirmation
      errors.add(:password_confirmation, "must match the password")
    end
  end