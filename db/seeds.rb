require 'random_data'

#Create Users
5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

users = User.all

#Create 10 Topics
10.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all

#Create 30 fake sponsored posts
30.times do
  SponsoredPost.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: rand(100)
  )
end

#Create 50 fake posts
50.times do
  post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )

  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end

posts = Post.all

#Create 100 fake comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# #Create 50 fake questions
# 50.times do
#   Question.create!(
#     title: RandomData.random_sentence,
#     body: RandomData.random_paragraph,
#     resolved: false
#   )
# end

#Create a unique post
unique_post = Post.find_or_create_by!(
    topic: topics.sample,
    user: users.sample,
    title: "Logan Writes Ruby",
    body: "With the help of Stack Overflow, Bloc, and his faithful mentor Raj"
)

#Create a unique comment
unique_comment = Comment.find_or_create_by!(
  user: users.sample,
  post: unique_post,
  body: "I'm writing a comment on Logan's post yaaaaaay"
)

#Create an admin user
admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

#Create a member
member = User.create!(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld',
  role: 'member'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
# puts "#{Question.count} questions created"
