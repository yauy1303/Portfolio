class Tag < ApplicationRecord
  # アソシエーション
  has_many :tag_relationships, dependent: :destroy, foreign_key: "tag_id"
  has_many :articles, through: :tag_relationships

  # バリデーション
  validates :tag_name, uniqueness: true, presence: true

end
