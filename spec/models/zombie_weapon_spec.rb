require 'rails_helper'

RSpec.describe ZombieWeapon, type: :model do
  describe "Associations" do
    it { should belong_to(:zombie) }
    it { should belong_to(:weapon) }
  end
end
