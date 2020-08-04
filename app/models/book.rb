class Book < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # ？？？？？
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true
  validates :body, presence: true

  validates :title, length: { maximum: 50 }
  validates :body, length: { maximum: 50 }
end
