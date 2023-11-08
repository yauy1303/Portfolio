class Comment < ApplicationRecord

  # アソシエーション
  belongs_to :member
  belongs_to :article

  # バリデーション
  validates :article_comment, presence: true
  validates :article_comment, length: { in: 1..280 }
end
