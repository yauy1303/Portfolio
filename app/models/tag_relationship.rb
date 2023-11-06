class TagRelationship < ApplicationRecord
  # アソシエーション
  belongs_to :article
  belongs_to :tag
  
  # バリデーション
  validates :article_id, presence: true
  validates :tag_id, presence: true
  
end
