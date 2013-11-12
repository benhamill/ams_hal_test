# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

authors = []

authors << Author.create(first_name: 'Ben', last_name: 'Hamill', created_at: 4.days.ago)
authors << Author.create(first_name: 'Bob', last_name: 'Potter', created_at: 3.days.ago)
authors << Author.create(first_name: 'Ryan', last_name: 'Michael', created_at: 2.days.ago)
authors << Author.create(first_name: 'Josh', last_name: 'Smith', created_at: 1.day.ago)
authors << Author.create(first_name: 'Raman', last_name: 'Sinha')

authors.each do |author|
  (rand(5) + 1).times do
    author.posts.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraphs.join,
    )
  end
end
