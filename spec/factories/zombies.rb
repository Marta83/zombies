FactoryBot.define do
  factory :zombie do
    name { Faker::Simpsons.character }
    hit_points { Faker::Number.between(1, 100)}
    brains_eaten { Faker::Number.between(1, 50)}
    turn_date {Faker::Date.between(2.days.ago, Date.today)}
  end

end

