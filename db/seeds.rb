# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

kaden = Genre.create(name: '家電')
kagu  = Genre.create(name: '家具')

Category.create([
  { name: '冷蔵庫', genre: kaden },
  { name: '洗濯機', genre: kaden },
  { name: 'デスク', genre: kagu }
])

category = Category.find_by(name: 'デスク')
category.items.create(name: "オフィスデスク", price: 20000)
category.items.create(name: "パソコンデスク", price: 15000)
category = Category.find_by(name: '冷蔵庫')
category.items.create(name: "クールフリーザー", price: 80000) 
category.items.create(name: "ひえひえプラス", price: 50000)
