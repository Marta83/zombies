FactoryBot.define do
  factory :armor do
    name { Faker::StarTrek.character }
    defense_points { Faker::Number.between(1, 50)}
    durability { Faker::Number.between(1, 50)}
    price {Faker::Number.between(1, 50)}
  end

end

