class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
    has_many :items
end
