require 'pry'
FactoryBot.define do
  factory :user, class: "User" do
    email { "exampleadmin@example.com" }
    password { "123456" }
    name { "ExampleName" }
    role { "subscriber" }
    nickname { "examplenick" }
  end

  factory :film do
    sequence(title) { |n| "Example approved film #{n}" }
    description { "Example long description" }
    duration { 60 }
    age_restriction { 10 }
    approved { true }
  end
end
