# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
class Seed
  def self.reset_database_before_seeding
    puts '========== Reset DB before seeding ========='
    require 'rake'
    Rake::Task['db:reset'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  end

  def self.seed_admin_user
    puts "========== Seed admin users =========="
    User.create!(email: 'example@example.com',
                 name: 'admin',
                 password: '123456',
                 nickname: 'admin',
                 birthday: Faker::Date.between(from: '1900-01-01', to: '2003-01-01'),
                 role: 'admin')
  end

  def self.seed_users(count = 1)
    puts "========== Seed #{count} users =========="
    count.times do
      User.create!(email: Faker::Internet.email,
                   name: Faker::Name.name,
                   password: '123456',
                   nickname: Faker::Lorem.word,
                   birthday: Faker::Date.between(from: '1900-01-01', to: '2003-01-01'))
    end
  end

  def self.seed_films(approved = 1, unapproved = 1)
    puts "========== Seed #{approved} approved films and #{unapproved} unapproved films =========="
    approved.times do
      Film.create!(title: Faker::Movie.title,
                   description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
                   trailer_url: Faker::Internet.url,
                   release_date: Faker::Date.between(from: '1950-01-01', to: Date.today),
                   duration: rand(20..200),
                   age_restriction: rand(0..21),
                   approved: true)
    end
    unapproved.times do
      Film.create!(title: Faker::Movie.title,
                   description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
                   trailer_url: Faker::Internet.url,
                   release_date: Faker::Date.between(from: '1950-01-01', to: Date.today),
                   duration: rand(20..200),
                   age_restriction: rand(0..21),
                   approved: false)
    end
  end

  def self.seed_categories
    puts '========== Seed categories =========='
    ['Family', 'Horror', 'Male', "Children's", 'Adult', 'Soap opera'].each do |category_name|
      Category.create!(name: category_name)
    end
  end

  def self.seed_countries
    puts '========== Seed countries =========='
    ISO3166::Country.translations(:en).each do |symb, country_name|
      Country.create!(name: country_name, banner: ISO3166::Country(symb).emoji_flag)
    end
  end

  def self.seed_genres
    puts '========== Seed genres =========='
    ['Action movie', 'Western', 'Detective', 'Comedy', 'Drama', 'Melodrama', 'Noir', 'Musical'].each do |genre|
      Genre.create!(name: genre)
    end
  end

  def self.seed_people(count = 1)
    puts "========== Seed #{count} people =========="
    count.times do
      birth = Faker::Date.between(from: '1800-01-01', to: Date.today)
      min_death_date = birth > Date.parse('1895-01-01') ? birth : Date.parse('1895-01-01')
      death = if Faker::Boolean.boolean(true_ratio: 0.3)
        Faker::Date.between(from: min_death_date, to: Date.today)
      end
      Person.create!(name: Faker::Name.name, birthday: birth, death_date: death)
    end
  end

  def self.seed_tags(count = 1)
    puts "========== Seed #{count} tags =========="
    count.times do
      Tag.create!(name: Faker::Lorem.word)
    end
  end

  def self.seed_comments(count_to_films = 0, count_to_comments = 0)
    puts "========== Seed #{count_to_films} comments to films =========="
    count_to_films.times do
      Comment.create!(commentable_id: Film.ids.sample,
                      commentable_type: 'Film',
                      user_id: User.ids.sample,
                      body: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 50))
    end
    puts "========== Seed #{count_to_comments} comments to comments =========="
    count_to_comments.times do
      Comment.create!(commentable_id: Film.ids.sample,
                      commentable_type: 'Comment',
                      user_id: User.ids.sample,
                      body: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 50))
    end
  end

  def self.seed_seasons(count = 1)
    puts "========== Seed #{count} seasons =========="
    count.times do
      film = Film.all.sample
      Season.create!(film_id: film.id,
                     title: "#{film.title} season: #{Faker::Lorem.word}",
                     description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
                     release_date: Faker::Date.between(from: film.release_date, to: Date.today))
    end
  end

  def self.seed_episodes(seasons_numb = 1, min = 5, max = 15)
    puts "========== Seed from #{min} to #{max} episodes for #{seasons_numb} seasons =========="
    seasons_numb.times do
      season = Season.all.sample
      rand(min..max).times do |ep_numb|
        season.episode.create!(title: ep_numb,
                               description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10))
      end
    end
  end

  def self.seed_f_categories
    puts '========== Seed film_categories =========='
    Film.all.each do |film|
      film.film_categories.create!(category_id: Category.ids.sample)
    end
  end

  def self.seed_f_countries
    puts '========== Seed film_countries =========='
    Film.all.each do |film|
      film.film_countries.create!(country_id: Country.ids.sample)
    end
  end

  def self.seed_f_genres
    puts '========== Seed film_genres =========='
    Film.all.each do |film|
      film.film_genres.create!(genre_id: Genre.ids.sample)
    end
  end

  def self.seed_f_people
    puts '========== Seed film_people =========='
    Film.all.each do |film|
      film.film_people.create!(person_id: Person.ids.sample, role: 'Actor')
      film.film_people.create!(person_id: Person.ids.sample, role: 'Director')
    end
  end

  def self.seed_f_tags
    puts '========== Seed film_tags =========='
    Film.all.each do |film|
      film.film_tags.create!(tag_id: Tag.ids.sample)
    end
  end

  def self.seed_watch_items
    puts '========== Seed watch_items =========='
    Film.all.each do |film|
      film.watch_items.create!(user_id: User.ids.sample, status: [0, 1, 2].sample)
    end
  end

  def self.seed_editor_role_and_add_film_creator(count_creators = 1, count_films = 1)
    puts "========== #{count_creators} users to editors, #{count_films} films add creators =========="
    User.all.sample(count_creators).each do |user|
      user.update!(role: 'editor')
    end
    Film.all.sample(count_films).each do |film|
      film.update!(creator_id: User.where(role: 'editor').ids.sample)
    end
  end
end

Seed.reset_database_before_seeding
Seed.seed_users(20)
Seed.seed_films(150, 50)
Seed.seed_categories
Seed.seed_countries
Seed.seed_genres
Seed.seed_people(100)
Seed.seed_tags(50)
Seed.seed_comments(200, 50)
Seed.seed_seasons(10)
Seed.seed_episodes(seasons_numb = 10, min = 3, max = 12)
Seed.seed_f_categories
Seed.seed_f_countries
Seed.seed_f_genres
Seed.seed_f_people
Seed.seed_f_tags
Seed.seed_watch_items
Seed.seed_editor_role_and_add_film_creator(count_creators = 10, count_films = 100)
Seed.seed_admin_user
