class Zombie < ApplicationRecord
  include AlgoliaSearch
  include Filterable

  validates_presence_of :name, :turn_date
  validates_numericality_of :hit_points, :brains_eaten, :speed


  has_many :zombie_armors
  has_many :zombie_weapons
  has_many :armors, through: :zombie_armors
  has_many :weapons, through: :zombie_weapons
  after_touch :index!

  scope :zombie_name, -> (name) { where name: name }
  scope :armor_id, -> (armor_id) { joins(:armors).where "armors.id" => armor_id }
  scope :weapon_id, -> (weapon_id) { joins(:weapons).where "weapons.id" => weapon_id }
  scope :turn_date_greater, -> (turn_date) { where("turn_date > ?", turn_date) }
  scope :turn_date_lesser, -> (turn_date) { where("turn_date < ?", turn_date) }

  algoliasearch per_environment: true, index_name: "zombie" do
    attributes :name, :armors, :weapons
    searchableAttributes ['name','armors', 'weapons']
    ranking ["exact"]
  end
end
