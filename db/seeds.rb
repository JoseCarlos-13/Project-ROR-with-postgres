# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Author.create(name: "Allison Reynolds")
Book.create(title: "Olhos Azuis Como o Céu Noturno", author_id: 1, sinopsis: "lorem ipsum la la la", release_date: "2003-04-14")
Customer.create(name: "Brian Johnson", email: "brianjohnsonocérebro@gmail.com", age: 16)
