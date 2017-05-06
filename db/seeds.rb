require 'random_data'

#Create 10 Topics
10.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all

#Create 50 fake posts
50.times do
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

#Create 100 fake comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

#Create 50 fake questions
50.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
  )
end

#Create a unique post
unique_post = Post.find_or_create_by!(
    title: "Logan Writes Ruby",
    body: "With the help of Stack Overflow, Bloc, and his faithful mentor Raj"
)

#Create a unique comment
unique_comment = Comment.find_or_create_by!(
  post: unique_post,
  body: "I'm writing a comment on Logan's post yaaaaaay"
)

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
