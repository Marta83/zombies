FactoryBot.define do
  factory :zombie do
    name { Faker::Simpsons.character }
    hit_points { Faker::Number.between(1, 100)}
    brains_eaten { Faker::Number.between(1, 50)}
    turn_date {Faker::Date.between(2.days.ago, Date.today)}

    factory :zombie_equiped do
      after :create do |zombie|
        armor = create :armor
        weapon = create :weapon
        create :zombie_armor,  zombie: zombie, armor: armor
        create :zombie_weapon,  zombie: zombie, weapon: weapon
        Zombie.reindex
        sleep 3
      end
    end

  end

end

