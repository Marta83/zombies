require 'rails_helper'

RSpec.describe Armor, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name = "Armor name"
    subject.price = 50
    subject.defense_points = 50
    subject.durability = 50
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.name = "Armor name"
    expect(subject).to_not be_valid
  end

  it "is not valid without defense_points" do
    subject.name = "Armor name"
    subject.price = 50
    expect(subject).to_not be_valid
  end

  it "is not valid without durability" do
    subject.name = "Armor name"
    subject.price = 50
    subject.defense_points = 50
    expect(subject).to_not be_valid
  end
end
