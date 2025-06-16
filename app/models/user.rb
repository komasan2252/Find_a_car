class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }, on: :create
  validates :family_size, presence: true, numericality: { only_integer: true }, on: :update
  validates :monthly_mileage, presence: true, numericality: { only_integer: true }, on: :update

  has_many :posts, dependent: :destroy
  has_one_attached :profile_image


  has_many :comments, dependent: :destroy
  has_many :comment_posts, through: :comments, source: :post
end
