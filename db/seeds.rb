# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  user = User.new(email: email,
              name: name,
              password: password,
              password_confirmation: password)
  user.skip_confirmation!
  user.save
  
  title = Faker::Book.title
  content =  Faker::Color.color_name
  Blog.create!(title: title,
               content: content,
               user_id: n + 1
               )
end