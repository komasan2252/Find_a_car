# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

makers = %w(
  TOYOTA
  NISSAN
  MAZDA
  SUBARU
  SUZUKI
  DAIHATSU
  HONDA
  LEXUS
  ISUZU
  MITSUBISHI
)

makers.each do |name|
  Maker.create!(name: name)
end

genres = %w(
  SUV
  セダン
  コンパクトカー
  ミニバン/ワンボックス
  軽自動車
  ハッチバック
  クーペ
  オープンカー
  スポーツカー
  クロスオーバー
  EV
)

genres.each do |name|
  Genre.create!(name: name)
end

(1..10).each do |n|
  User.create!(
    name: "user_#{n}",
    email: "user_#{n}@test.com",
    password: "password"
  )
end

Admin.create!(email: "admin@test.com", password: "password")