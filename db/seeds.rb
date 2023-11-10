# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者権限
sugi = Member.find_or_create_by!(email: "sugi@sugi") do |member|
  member.name = "sugi"
  member.password = "123456789"
  member.password_confirmation = "123456789"
  member.admin = true
end

# 5.times do |num|
#   member =  Member.create!(
#     name: "メンバー#{num + 1}",
#     email: "email#{num + 1}@email",
#     password: "password#{num + 1}",
#     password_confirmation: "password#{num + 1}",
#     admin: false)

#     # member.get_profile_image
# end

Article.find_or_create_by!(title: "のあです") do |article|
  article.text = "１回目の投稿です"
  article.member = sugi

  # article.get_article_image
end