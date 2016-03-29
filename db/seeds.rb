require 'faker'

users = User.all?

  Topic.create!(
  user_id: "1"
  title: "First Topic"
  )

  Topic.create!(
  user_id: "2"
  title: "Second Topic"
  )

  topics = Topic.all

  topics.each do |topic|
    2.times do
      topic.bookmarks.create!(
      user_id: "1",
      url: Faker::Internet.url("example.com")
      )
    end
  end

  topics.each do |topic|
    2.times do
      topic.bookmarks.create!(
      user_id: "2"
      url: Faker::Internet.url("example.com")
      )
    end
  end

  bookmarks = Bookmark.all

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Topic.count} lists created"
  puts "#{Bookmark.count} items created"
