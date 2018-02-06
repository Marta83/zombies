require 'rails_helper'

RSpec.describe Weapon, type: :model do
  subject {
    described_class.new(name: "Armor name",
                        price: 50,
                        attack_points: 50,
                        durability: 50) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without attack_points" do
      subject.attack_points = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without durability" do
      subject.durability = nil
      expect(subject).to_not be_valid
    end
  end
  describe "Associations" do
    it { should have_one(:zombie_weapon) }
  end

end
