class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@guest') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "ゲスト"
    end
  end

  # アソシエーション
  has_many :articles, dependent: :destroy

  # 画像投稿用（アクティブストレージ）
  has_one_attached :profile_image
  has_one_attached :cover_image


end
