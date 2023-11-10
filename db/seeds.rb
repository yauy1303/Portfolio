# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者権限
Member.create!(
  name: "sugi",
  email: "sugi@sugi",
  password: "123456789",
  password_confirmation: "123456789",
  admin: true)

5.times do |num|
  Member.create!(
    name: "メンバー#{num + 1}",
    email: "email#{num + 1}@email",
    password: "password#{num + 1}",
    password_confirmation: "password#{num + 1}",
    admin: false)
end