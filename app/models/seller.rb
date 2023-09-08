class Seller < ApplicationRecord
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }
    validates :sellername, presence: true
    has_many :shops, dependent: :destroy
    has_many :items, dependent: :destroy
    has_many :orders, dependent: :destroy
    validates :confirm_password, presence: true
    validate :password_match
end


private

  def password_match
    if password != confirm_password
      errors.add(:confirm_password, "must match the password")
    end
  end
