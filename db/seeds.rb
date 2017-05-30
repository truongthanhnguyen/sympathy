User.create!(name: "Example User", email: "example@railstutorial.org", password: "1", encrypted_password: "1", is_admin: true)

30.times do |n|
	name  = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create!(name: name, email: email, password: password, encrypted_password: password)
end

users = User.order(:created_at).take(6)
50.times do
  content_type = Faker::Lorem.sentence(5)
  users.each {|user| user.posts.create!(content_type: content_type)}
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}
