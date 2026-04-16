class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
    has_many :items
    has_many :wishlists
    has_many :wishlisted_by, through: :wishlists, source: :user

    def self.ransackable_attributes(auth_object = nil)
     ["category_id", "created_at", "description", "id", "id_value", "name", "price", "updated_at"]
    end

end
