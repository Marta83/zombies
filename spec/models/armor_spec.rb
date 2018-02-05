require 'rails_helper'

RSpec.describe Armor, type: :model do
  subject {
        described_class.new(name: "Armor name",
                            price: 50,
                            defense_points: 50,
                            durability: 50) }

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

  it "is not valid without defense_points" do
    subject.defense_points = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without durability" do
    subject.durability = nil
    expect(subject).to_not be_valid
  end
end
