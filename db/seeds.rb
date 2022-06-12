10.times do |n|
  User.create!(
    name: "テストユーザー#{n}"
  )
end
