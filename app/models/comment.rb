class Comment < ApplicationRecord

  # アソシエーション
  belongs_to :member
  belongs_to :article

  # バリデーション
  validates :article_comment, presence: true, length: { in: 1..200 }
end
