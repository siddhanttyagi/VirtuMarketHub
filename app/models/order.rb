class Order < ApplicationRecord
  belongs_to :user
  belongs_to :seller
  belongs_to :shop
  validates :payment_check, inclusion: { in: [true, false] }
  validates :order_details, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
