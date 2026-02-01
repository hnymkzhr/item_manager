# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Genre.destroy_all
Category.destroy_all
Item.destroy_all
genres = Genre.create!([{name: 'Books'}, {name: 'Electronics'}, {name: 'Clothing'}])
categories = []
items = []
genres.each do |genre|
  3.times do |i|
    category = genre.categories.create!(name: "#{genre.name} Category #{i + 1}")
    categories << category
    5.times do |j|
      item = category.items.create!(
        name: "#{category.name} Item #{j + 1}",
        description: "Description for #{category.name} Item #{j + 1}",
        price: (j + 1) * 1000
      )
      items << item
    end
  end
end
puts "Seeded #{Genre.count} genres, #{Category.count} categories, and #{Item.count} items."