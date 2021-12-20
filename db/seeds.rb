# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rake'
Rails.application.load_tasks
Rake::Task['db:reset'].invoke
100.times do
  User.create!(email:Faker::Internet.email,
               name:Faker::Name.name,
               nickname:Faker::Lorem.word,
               birthday:Faker::Date.between(from: '1900-01-01', to: '2003-01-01'))
end
1000.times do
  Film.create!(title:Faker::Movie.title,
               description:Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
               trailer_url:Faker::Internet.url,
               release_date:Faker::Date.between(from: '1950-01-01', to: Date.today),
               duration:rand(20..200),
               age_restriction:rand(0..21))
end
['Family', 'Horror', 'Male', "Children's", 'Adult', 'Soap opera'].each do |category_name|
  Category.create!(name:category_name)
end
ISO3166::Country.translations(:en).each do |symb, country_name|
  Country.create!(name:country_name, banner:ISO3166::Country(symb).emoji_flag)
end
