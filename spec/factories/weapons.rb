FactoryBot.define do
  factory :weapon do
    name { Faker::DragonBall.character }
    attack_points { Faker::Number.between(1, 50)}
    durability { Faker::Number.between(1, 50)}
    price {Faker::Number.between(1, 50)}
  end

end

