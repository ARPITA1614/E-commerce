# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)

5.times do 
    # byebug
    Product.create!(
        name: "Induction",
        price: 2200,
        description: "Bajaj",
        category_id: 1
    )
end
puts "Created"
User.create!(email: 'arpitas9@chetu.com', password: 'password', password_confirmation: 'password', role: :super_admin) if Rails.env.development?