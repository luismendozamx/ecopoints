# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

User.create!(email: "luis@mendoza.io", password: "luismendoza", is_admin: true)

50.times do |n|
  clave = Faker::Number.number(6)
  email = Faker::Internet.email
  Student.create!(clave_unica: clave, email: email, points: 0)
end
