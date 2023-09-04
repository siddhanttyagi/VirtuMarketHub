class User < ApplicationRecord
    validates :email, presence: true
    validates :password, presence: true, :length => {:within => 6..40}
    validates :username, presence: true
    has_many :orders, dependent: :destroy
end
