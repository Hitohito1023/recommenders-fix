class User < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :introduction, length: { maximum: 100 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_items, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorites_post_items, through: :favorites, source: :post_item
  attachment :profile_image

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed

  scope :only_valid, -> { where(is_valid: true) }

  enum is_valid: {"有効": true, "無効": false}

  def active_for_authentication?
    super && (self.is_valid === "有効")
  end

  def self.search_for(content, method)
    User.where('name LIKE ?', '%' + content + '%')
  end

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end


end
