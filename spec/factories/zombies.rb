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
        create_list :zombie_armor, 3, zombie: zombie, armor: armor
        create_list :zombie_weapon, 3, zombie: zombie, weapon: weapon
        Zombie.reindex
        sleep 3
      end
    end

  end

end

