class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email,           format: { with: /@/}, on: :create
         validates :password,        length: { minimum: 6 }, confirmation: true,  format: { with: /\A[a-zA-Z0-9]+\z/ }, on: :create
       
         validates :name, presence: true
         validates :profile, presence: true    
         has_one_attached :user_image   
         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :likes, dependent: :destroy
         
         def liked_by?(post_id)
          likes.where(post_id: post_id).exists?
        end
end
