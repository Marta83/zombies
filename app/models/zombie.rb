class Zombie < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :turn_date
end
