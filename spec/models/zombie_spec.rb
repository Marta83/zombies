require 'rails_helper'

RSpec.describe Zombie, type: :model do
  subject {
    described_class.new(name: "Zombie name",
                        turn_date: DateTime.now - 1.week) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a turn_date" do
      subject.turn_date = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:zombie_armors) }
    it { should have_many(:armors) }
    it { should have_many(:weapons) }
  end

end
