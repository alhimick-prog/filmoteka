# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed
  def self.reset_database_before_seeding
    puts "========== Reset DB before seeding ========="
    require 'rake'
    Rake::Task['db:reset'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  end
  def self.seed_users(number=1)
    puts "========== Seed #{number} users =========="
    number.times do
      User.create!(email:Faker::Internet.email,
                   name:Faker::Name.name,
                   password: '123456',
                   nickname:Faker::Lorem.word,
                   birthday:Faker::Date.between(from: '1900-01-01', to: '2003-01-01'))
    end
  end
  def self.seed_films(number=1)
    puts "========== Seed #{number} films =========="
    number.times do
      Film.create!(title:Faker::Movie.title,
                   description:Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
                   trailer_url:Faker::Internet.url,
                   release_date:Faker::Date.between(from: '1950-01-01', to: Date.today),
                   duration:rand(20..200),
                   age_restriction:rand(0..21))
    end
  end
  def self.seed_categories
    puts "========== Seed categories =========="
    ['Family', 'Horror', 'Male', "Children's", 'Adult', 'Soap opera'].each do |category_name|
      Category.create!(name:category_name)
    end
  end
  def self.seed_country
    puts "========== Seed country =========="
    ISO3166::Country.translations(:en).each do |symb, country_name|
      Country.create!(name:country_name, banner:ISO3166::Country(symb).emoji_flag)
    end
  end
  def self.seed_genre
    puts "========== Seed genres =========="
    ['Action movie', 'Western', 'Detective', 'Comedy', 'Drama', 'Melodrama', 'Noir', 'Musical'].each do |genre|
      Genre.create!(name:genre)
    end
  end
  def self.seed_person(number=1)
    puts "========== Seed #{number} person =========="
    number.times do
      birth = Faker::Date.between(from: '1800-01-01', to: Date.today)
      min_death_date = birth > Date.parse('1895-01-01') ? birth : Date.parse('1895-01-01')
      death = nil
      if Faker::Boolean.boolean(true_ratio: 0.3)
        death = Faker::Date.between(from: min_death_date, to: Date.today)
      end
      Person.create!(name:Faker::Name.name,
                     birthday:birth,
                     death_date:death)
    end
  end
  def self.seed_tag(number=1)
    puts "========== Seed #{number} tag =========="
    number.times do
      Tag.create!(name:Faker::Lorem.word)
    end
  end
  def self.seed_comment(number_to_films=0, number_to_comments=0)
    puts "========== Seed #{number_to_films} comment to films =========="
    number_to_films.times do
      object_id = rand(1..Film.count)
      author_id = rand(1..User.count)
      Comment.create!(commentable_id:object_id,
                      commentable_type:'Film',
                      user_id:author_id,
                      body:Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 50))
    end
    puts "========== Seed #{number_to_comments} comment to comments =========="
    number_to_comments.times do
      object_id = rand(1..Comment.count)
      author_id = rand(1..User.count)
      Comment.create!(commentable_id:object_id,
                      commentable_type:'Comment',
                      user_id:author_id,
                      body:Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 50))
    end
  end
  def self.seed_season(number=1)
    puts "========== Seed #{number} season =========="
    number.times do
      belongs_to_id = rand(1..Film.count)
      Season.create!(film_id:belongs_to_id,
                     title:"#{Film.find(belongs_to_id).title} season: #{Faker::Lorem.word}",
                     description:Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
                     release_date:Faker::Date.between(from: Film.find(belongs_to_id).release_date, to: Date.today))
    end
  end
  def self.seed_episode(seasons_numb=1, min=5, max=15)
    puts "========== Seed from #{min} to #{max} episodes for #{seasons_numb} season =========="
    seasons_numb.times do
      belongs_to_season_id = rand(1..Season.count)
      rand(min..max).times do |ep_numb|
        Episode.create!(season_id:belongs_to_season_id,
                        title:ep_numb,
                        description:Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10))
      end
    end
  end
  def self.seed_f_category
    puts "========== Seed film_category =========="
    Film.count.times do |object_id|
      FilmCategory.create!(film_id:(object_id + 1),
                           category_id:rand(1..Category.count))
    end
  end
  def self.seed_f_country
    puts "========== Seed film_country =========="
    Film.count.times do |object_id|
      FilmCountry.create!(film_id:(object_id + 1),
                          country_id:rand(1..Country.count))
    end
  end
  def self.seed_f_genre
    puts "========== Seed film_genre =========="
    Film.count.times do |object_id|
      FilmGenre.create!(film_id:(object_id + 1),
                        genre_id:rand(1..Genre.count))
    end
  end
  def self.seed_f_person
    puts "========== Seed film_person =========="
    Film.count.times do |object_id|
      FilmPerson.create!(film_id:(object_id + 1),
                         person_id:rand(1..Person.count),
                         role:'Actor')
      FilmPerson.create!(film_id:(object_id + 1),
                         person_id:rand(1..Person.count),
                         role:'Director')
    end
  end
  def self.seed_f_tag
    puts "========== Seed film_tag =========="
    Film.count.times do |object_id|
      FilmTag.create!(film_id:(object_id + 1),
                      tag_id:rand(1..Tag.count))
    end
  end
  def self.seed_watch_item
    puts "========== Seed watch_item =========="
    Film.count.times do |object_id|
      WatchItem.create!(film_id:(object_id + 1),
                        user_id:rand(1..User.count),
                        status:rand(0..2))
    end
  end
  def self.seed_editor_role_and_add_film_creator(numb_creators=1, numb_films=1)
    puts "========== #{numb_creators} users to editor, #{numb_films} films add creator =========="
    numb_creators.times do |object_id|
      User.find(object_id + 1).update!(role:'Editor')
    end
    numb_films.times do |object_id|
      Film.find(object_id + 1).update!(creator_id:rand(1..numb_creators))
    end
  end
  # def self.seed_(number=1)
  #   puts "========== Seed #{number} =========="
  #   number.times do
  #   end
  # end
end

Seed.reset_database_before_seeding
Seed.seed_users(20)
Seed.seed_films(200)
Seed.seed_categories
Seed.seed_country
Seed.seed_genre
Seed.seed_person(100)
Seed.seed_tag(50)
Seed.seed_comment(200, 50)
Seed.seed_season(10)
Seed.seed_episode(seasons_numb=10, min=3, max=12)
Seed.seed_f_category
Seed.seed_f_country
Seed.seed_f_genre
Seed.seed_f_person
Seed.seed_f_tag
Seed.seed_watch_item
Seed.seed_editor_role_and_add_film_creator(numb_creators=10, numb_films=100)
