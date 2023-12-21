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

  # バリデーション
  validates :title, presence: true, length: { in: 1..40 }

  # action textの使用
  has_rich_text :content

  # 画像投稿用（アクティブストレージ）
  has_one_attached :article_image

  # 画像未設定の処理
  def get_article_image
    unless article_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      article_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    article_image
  end

  # タグ機能管理
  def save_tag(tag_list)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    # リファクタリング
    # old_tags.each do |old|
    #   self.tags.delete Tag.find_by(tag_name: old)
    # end
    self.tags.where(tag_name: old_tags).destroy_all

    new_tags.each do |new|
      truncated_tag = new[0, 30] # タグを30文字以内に制限する
      new_post_tag = Tag.find_or_create_by(tag_name: truncated_tag)
      self.tags << new_post_tag
    end

  end

  # Updateの時、タグの数を減らした際の記述
  def update_tag(tag_list)
    current_tags = self.tags.pluck(:tag_name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    # リファクタリング
    # old_tags.each do |old|
    #   self.tags.delete Tag.find_by(tag_name: old)
    # end
    self.tags.where(tag_name: old_tags).destroy_all

    new_tags.each do |new|
      truncated_tag = new[0, 30] # タグを30文字以内に制限する
      new_post_tag = Tag.find_or_create_by(tag_name: truncated_tag)
      self.tags << new_post_tag
    end

  end

  # いいねしているかの判断
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

end
