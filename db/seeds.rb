# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

counter = 0
File.foreach("db/seeds/News_Category_Dataset_v3.json") do |line|
  article = JSON.parse(line)
  Article.create(title: article["headline"])
  counter += 1
  puts "Articles created #{counter} / 10000" if counter % 1000 == 0
end
