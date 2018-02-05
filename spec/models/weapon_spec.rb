require 'rails_helper'

RSpec.describe Weapon, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name = "Weapon name"
    subject.price = 50
    subject.attack_points = 50
    subject.durability = 50
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.name = "Weapon name"
    expect(subject).to_not be_valid
  end

  it "is not valid without attack_points" do
    subject.name = "Weapon name"
    subject.price = 50
    expect(subject).to_not be_valid
  end

  it "is not valid without durability" do
    subject.name = "Weapon name"
    subject.price = 50
    subject.attack_points = 50
    expect(subject).to_not be_valid
  end
end
