class Item < ApplicationRecord
  belongs_to :seller
  belongs_to :shop
  validates :item_name, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
