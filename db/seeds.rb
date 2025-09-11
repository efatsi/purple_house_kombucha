# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

flavors = [
  {
    name: "Ginger Rosemary",
    description: "Warming ginger paired with aromatic fresh rosemary for a herbaceous, refreshing kombucha."
  },
  {
    name: "Blackberry Ginger",
    description: "Sweet blackberries combined with zesty ginger create a perfectly balanced fruity kombucha."
  },
  {
    name: "Strawberry Lemonade",
    description: "Bright kombucha featuring juicy strawberries and tangy lemon for a nostalgic treat."
  },
  {
    name: "Ginger Orange Turmeric",
    description: "Spicy ginger, bright orange, and golden turmeric creating an immune-boosting powerhouse."
  },
  {
    name: "Fruit Punch",
    description: "A tropical medley of mixed fruits delivering a sweet, vibrant kombucha."
  }
]

flavors.each do |flavor_attrs|
  Flavor.find_or_create_by!(name: flavor_attrs[:name]) do |flavor|
    flavor.description = flavor_attrs[:description]
  end
end
