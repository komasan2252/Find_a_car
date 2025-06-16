class Post < ApplicationRecord
  validates :car_name, presence: true
  validates :year_name, presence: true
  validates :year_number, presence: true
  validates :good_point, length: { maximum: 1500 }
  validates :bad_point, length: { maximum: 1500 }
  validates :fuel_efficiency, presence: true
  validates :riding_capacity, presence: true

  enum year_name: { showa: 0, heisei: 1, reiwa: 2 }

  belongs_to :user
  belongs_to :maker
  belongs_to :genre
  has_one_attached :car_image


  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user
end
