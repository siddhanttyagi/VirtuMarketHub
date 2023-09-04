class Seller < ApplicationRecord
    has_many :shops, dependent: :destroy
    has_many :items, dependent: :destroy
    has_many :orders, dependent: :destroy
end
