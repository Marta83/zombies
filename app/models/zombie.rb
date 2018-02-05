class Zombie < ApplicationRecord
  validates_presence_of :name, :turn_date
end
