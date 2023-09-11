class Shop < ApplicationRecord
  belongs_to :seller
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :shop_image
  validates :shop_name, presence: true
  validates :shop_summary, presence: true
end
