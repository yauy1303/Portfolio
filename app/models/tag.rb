class Tag < ApplicationRecord
  # アソシエーション
  has_many :tag_relationships, dependent: :destoroy, forein_key: "tag_id"
  has_many :articles, through: :tag_relationships
  
  # バリデーション
  validates :taname, uniqueness: true, presence: true
  
end
