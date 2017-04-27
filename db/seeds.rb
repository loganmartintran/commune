require 'random_data'

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by!(
  title: "Logan Writes Ruby",
  body: "With the help of Stack Overflow, Bloc, and his faithful mentor Raj"
)

Comment.find_or_create_by!(
  post: "Logan Writes Ruby",
  body: "I'm writing a comment on Logan's post yaaaaaay"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
