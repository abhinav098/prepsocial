User.create!(name:  "Abhinav Garg",
             email: "abhinav@prepsocial.com",
             username: "abhinav012",
             password: "hello123",
             password_confirmation: "hello123",
             admin: true ,
             activated: true,
             activated_at: Time.zone.now)


99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@prepsocial.com"
  password = "hello123"
  username = "prepsocial#{n+1}"
  User.create!(name:  name,
               email: email,
               username: username,
               password:password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
