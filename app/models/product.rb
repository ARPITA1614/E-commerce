class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
    has_many :items
    has_many :wishlists
    has_many :wishlisted_by, through: :wishlists, source: :user

end
