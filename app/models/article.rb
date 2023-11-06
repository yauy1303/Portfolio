class Article < ApplicationRecord
  # アソシエーション
  belongs_to :member

  # 画像投稿用（アクティブストレージ）
  has_one_attached :article_image

end
