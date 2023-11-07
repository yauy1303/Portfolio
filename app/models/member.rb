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

  # 画像未設定の場合の処理
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image
  end


end
