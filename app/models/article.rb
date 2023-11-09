class Article < ApplicationRecord

  # アソシエーション

  # タグ機能
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships

  # コメント機能
  has_many :comments, dependent: :destroy

  # いいね機能
  has_many :favorites, dependent: :destroy

  belongs_to :member

  # 画像投稿用（アクティブストレージ）
  has_one_attached :article_image

  # 画像未設定の処理
  def get_article_image
    unless article_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    article_image
  end

  # タグ機能管理
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

  # Updateの時、タグの数を減らした際の記述
  def update_tag(tag_list)
    tag_relationships.map(&:destroy)
    return unless tag_list
    tag_list.each do |tag|
      tag = Tag.find_or_create_by(tag_name: tag)
      TagRelationship.create!(tag: tag, article: self)
    end
  end

  # いいねしているかの判断
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

end
