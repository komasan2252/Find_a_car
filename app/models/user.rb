class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }, on: :create
  validates :family_size, presence: true, numericality: { only_integer: true }, on: :update
  validates :monthly_mileage, presence: true, numericality: { only_integer: true }, on: :update
end
