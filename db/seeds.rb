# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#require 'rake'
class Seed
  def self.reset_database_before_seeding
    puts "========== Reset DB before seeding ========="
    #Rails.application.load_tasks
    require 'rake'
    Rake::Task['db:reset'].invoke
  end
  def self.seed_users
    puts "========== Seed users ========="
    100.times do
      User.create!(email:Faker::Internet.email,
                   name:Faker::Name.name,
                   nickname:Faker::Lorem.word,
                   birthday:Faker::Date.between(from: '1900-01-01', to: '2003-01-01'))
    end
  end
  def self.seed_films
    puts "========== Seed films ========="
    1000.times do
      Film.create!(title:Faker::Movie.title,
                   description:Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
                   trailer_url:Faker::Internet.url,
                   release_date:Faker::Date.between(from: '1950-01-01', to: Date.today),
                   duration:rand(20..200),
                   age_restriction:rand(0..21))
    end
  end
  def self.seed_categories
    puts "========== Seed categories ========="
    ['Family', 'Horror', 'Male', "Children's", 'Adult', 'Soap opera'].each do |category_name|
      Category.create!(name:category_name)
    end
  end
  def self.seed_country
    puts "========== Seed country ========="
    ISO3166::Country.translations(:en).each do |symb, country_name|
      Country.create!(name:country_name, banner:ISO3166::Country(symb).emoji_flag)
    end
  end
  def self.seed_
    puts "========== Seed  ========="
  end
end

Seed.reset_database_before_seeding
#Seed.seed_users
#Seed.seed_films
#Seed.seed_categories
#Seed.seed_country
