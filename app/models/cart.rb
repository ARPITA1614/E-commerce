class Cart < ApplicationRecord
    belongs_to :user
    has_many :items, dependent: :destroy
    has_many :products, through: :items 

    def total_price
        items.sum{ |item| item.product.price*item.quantity }
    end
end


