class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :post_image
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :post_image, presence: true
end
