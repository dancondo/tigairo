# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
User.destroy_all
Country.destroy_all
categories = %w[ごはん 友達との接し方 お店の人 ファッション お祝い 時間 街 仕事 恋愛 その他]
categories.each do |category|
  next unless Category.where(name: category) == []
  Category.create!(name: category)
end
countries = %w[アメリカ ブラジル カナダ イギリス オーストラリア]
countries.each do |country|
  next unless Country.where(name: country) == []
  Country.create!(name: country, photo_path: "flags/#{country}.png")
end
