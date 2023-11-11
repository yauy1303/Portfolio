# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# メンバーサンプル
# admin = true
sugi = Member.find_or_create_by!(email: "sugi@sugi") do |member|
  member.name = "sugi"
  member.introduction = "よろしくお願いします！"
  member.password = "123456789"
  member.password_confirmation = "123456789"
  member.admin = true
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_1.jpg"), filename:"user_1.jpg")
end

# admin = false
alice = Member.find_or_create_by!(email: "alice@alice") do |member|
  member.name = "alice"
  member.introduction = "よろしくお願いします！"
  member.password = "password1"
  member.password_confirmation = "password1"
  member.admin = false
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_2.jpg"), filename:"user_2.jpg")
end




# 記事サンプル
article1 = Article.find_or_create_by!(title: "のあです") do |article|
  article.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. "
  article.member = sugi
  article.article_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/article_1.jpg"), filename:"article_1.jpg")
end

article2 = Article.find_or_create_by!(title: "ドッグランで遊んだよ") do |article|
  article.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. "
  article.member = alice
  article.article_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/article_2.jpg"), filename:"article_2.jpg")
end

# タグサンプル
tag1 = Tag.create(tag_name:"トイプードル")
tag2 = Tag.create(tag_name:"散歩")
tag3 = Tag.create(tag_name:"ゴールデンレトリバー")
tag4 = Tag.create(tag_name:"ドッグラン")

article1.tags << tag1
article1.tags << tag2
article2.tags << tag3
article2.tags << tag4








# 5.times do |num|
#   member =  Member.create!(
#     name: "メンバー#{num + 1}",
#     email: "email#{num + 1}@email",
#     password: "password#{num + 1}",
#     password_confirmation: "password#{num + 1}",
#     admin: false)

#     # member.get_profile_image
# end