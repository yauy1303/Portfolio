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
  member.introduction = "愛犬との日常を楽しんでいます。"
  member.password = "123456789"
  member.password_confirmation = "123456789"
  member.admin = true
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_1.jpg"), filename:"user_1.jpg")
end

# admin = false
alice = Member.find_or_create_by!(email: "email2@email") do |member|
  member.name = "alice"
  member.introduction = "ペットのラッキーと週末はドッグランに行ってます！"
  member.password = "password2"
  member.password_confirmation = "password2"
  member.admin = false
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_2.jpg"), filename:"user_2.jpg")
end

bob = Member.find_or_create_by!(email: "email3@email") do |member|
  member.name = "bob"
  member.introduction = "ワンちゃんとのコミュニケーションについて投稿します。"
  member.password = "password3"
  member.password_confirmation = "password3"
  member.admin = false
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_3.jpg"), filename:"user_3.jpg")
end

carol = Member.find_or_create_by!(email: "email4@email") do |member|
  member.name = "carol"
  member.introduction = "犬と一緒にカワイイを楽しんでいます！"
  member.password = "password4"
  member.password_confirmation = "password4"
  member.admin = false
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_4.jpg"), filename:"user_4.jpg")
end

dave = Member.find_or_create_by!(email: "email5@email") do |member|
  member.name = "dave"
  member.introduction = "僕もパートナーもグルメです！"
  member.password = "password5"
  member.password_confirmation = "password5"
  member.admin = false
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_5.jpg"), filename:"user_5.jpg")
end

eve = Member.find_or_create_by!(email: "email6@email") do |member|
  member.name = "eve"
  member.introduction = "セラピードッグの活動を行っています。"
  member.password = "password6"
  member.password_confirmation = "password6"
  member.admin = false
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_6.jpg"), filename:"user_6.jpg")
end


# 記事サンプル
article1 = Article.find_or_create_by!(title: "のあと散歩です") do |article|
  article.text = "Lorem ipsum dolor sit amet"
  article.member = sugi
  article.article_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/article_1.jpg"), filename:"article_1.jpg")
end

article2 = Article.find_or_create_by!(title: "ドッグランで遊んだよ") do |article|
  article.text = "Lorem ipsum dolor sit amet"
  article.member = alice
  article.article_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/article_2.jpg"), filename:"article_2.jpg")
end

article3 = Article.find_or_create_by!(title: "お手から始めるしつけの方法") do |article|
  article.text = "Lorem ipsum dolor sit amet"
  article.member = bob
  article.article_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/article_3.jpg"), filename:"article_3.jpg")
end

article4 = Article.find_or_create_by!(title: "愛犬にかわいい洋服を着せよう！") do |article|
  article.text = "Lorem ipsum dolor sit amet"
  article.member = carol
  article.article_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/article_4.jpg"), filename:"article_4.jpg")
end

article5 = Article.find_or_create_by!(title: "愛犬大喜び！絶品ごはんの作り方") do |article|
  article.text = "Lorem ipsum dolor sit amet"
  article.member = dave
  article.article_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/article_5.jpg"), filename:"article_5.jpg")
end

article6 = Article.find_or_create_by!(title: "セラピードッグイベントを開催します") do |article|
  article.text = "Lorem ipsum dolor sit amet"
  article.member = eve
  article.article_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/article_6.jpg"), filename:"article_6.jpg")
end


# タグサンプル
tag1 = Tag.create(tag_name:"トイプードル")
tag2 = Tag.create(tag_name:"散歩")
tag3 = Tag.create(tag_name:"ゴールデンレトリバー")
tag4 = Tag.create(tag_name:"ドッグラン")
tag5 = Tag.create(tag_name:"しつけ")
tag6 = Tag.create(tag_name:"コミュニケーション")
tag7 = Tag.create(tag_name:"ファッション")
tag8 = Tag.create(tag_name:"アイテム")
tag9 = Tag.create(tag_name:"ごはん")
tag10 = Tag.create(tag_name:"クッキング")
tag11 = Tag.create(tag_name:"セラピードッグ")
tag12 = Tag.create(tag_name:"イベント")

article1.tags << tag1
article1.tags << tag2
article2.tags << tag3
article2.tags << tag4
article3.tags << tag5
article3.tags << tag6
article4.tags << tag7
article4.tags << tag8
article5.tags << tag9
article5.tags << tag10
article6.tags << tag11
article6.tags << tag12
