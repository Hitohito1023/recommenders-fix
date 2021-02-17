class Genre < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :post_items, dependent: :destroy

end
