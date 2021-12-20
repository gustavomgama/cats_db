FactoryBot.define do
  factory :cat do
    name { Faker::Creature::Cat.name }
    age { Faker::Number.digit } 
    weight { Faker::Number.digit }
    eye_color { Faker::Color.color_name }
  end
end
