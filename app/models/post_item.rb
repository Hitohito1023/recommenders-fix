class PostItem < ApplicationRecord

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :genre_id, presence: true

  belongs_to :user

  attachment :image
  belongs_to :genre

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    PostItem.where('name LIKE ?', '%' + content + '%')
  end

end
