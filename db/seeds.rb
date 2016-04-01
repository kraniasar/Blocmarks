require 'faker'

5.times do
 user = User.new(
   email:    Faker::Internet.email,
   password: Faker::Lorem.characters(10)
 )
 user.save!
end

admin = User.new(
  email:    "admin@blocmarks.us",
  password: "helloworld"
)
admin.save!

users = User.all

Topic.create!(
  user_id: 6,
  title: "First Topic"
)

Topic.create!(
  user_id: 6,
  title: "Second Topic"
)

topics = Topic.all

20.times do
 app = Bookmark.create!(
   topic:   topics.sample,
   url: Faker::Internet.url('example.com')
 )
end

bookmarks = Bookmark.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} lists created"
puts "#{Bookmark.count} items created"
