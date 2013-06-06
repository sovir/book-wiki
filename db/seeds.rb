# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sherrytonger = User.create!(name: "sherrytonger",
													  email: "sherrytonger@gmail.com",
													  password: "82541735",
													  password_confirmation: "82541735")
sherrytonger.toggle!(:admin)
