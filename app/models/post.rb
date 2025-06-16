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
  def self.ransackable_attributes(auth_object = nil)
    [
      "car_name",
      "good_point",
      "bad_point",
      "fuel_efficiency",
      "riding_capacity",
      "year_name",
      "year_number",
      "maker_id",
      "genre_id",
      "user_id",
      "star",
      "created_at",
      "updated_at",
      "id"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    [
      "user", "maker", "genre",
      "comments", "comment_users",
      "car_image_attachment", "car_image_blob"
    ]
  end

  ransacker :combined do |parent|
    Arel::Nodes::SqlLiteral.new(
      "CONCAT_WS(' ', car_name, good_point, bad_point, fuel_efficiency, riding_capacity, year_number, star)"
    )
  end
end
