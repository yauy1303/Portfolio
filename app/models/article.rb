class Article < ApplicationRecord
  # アソシエーション
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships

  belongs_to :member

  # 画像投稿用（アクティブストレージ）
  has_one_attached :article_image

    # タグ機能管理
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

end
