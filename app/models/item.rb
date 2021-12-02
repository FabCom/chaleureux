class Item < ApplicationRecord
  validates :title, :description, :price, :image_url, presence:true
  validates :price, numericality: {greater_than: 0 }
  
  has_many :join_table_item_carts, dependent: :destroy
  has_many :carts, through: :join_table_item_carts
  has_many :join_table_item_orders, dependent: :destroy
  has_many :orders, through: :join_table_item_orders
  has_many :join_table_item_categories, dependent: :destroy, dependent: :destroy
  has_many :categories, through: :join_table_item_categories
  has_one_attached :item_picture
end
