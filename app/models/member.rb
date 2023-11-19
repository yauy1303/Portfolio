class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  validates :name, presence: true

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@guest') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "ゲスト"
    end
  end

  # アソシエーション
  has_many :articles, dependent: :destroy

  # コメント機能
  has_many :comments, dependent: :destroy

  # いいね機能
  has_many :favorites, dependent: :destroy

  # フォロー機能
  has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォローフォロワー一覧画面用
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followeds, through: :passive_relationships, source: :following


  def follow(member)
    active_relationships.create(followed_id: member.id)
  end

  def unfollow(member)
    active_relationships.find_by(followed_id: member.id).destroy
  end

  def following?(member)
    followings.include?(member)
  end

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

  # 退会メンバーのログイン制限
  def active_for_authentication?
    self.is_member == false
  end


end
