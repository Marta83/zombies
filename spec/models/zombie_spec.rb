require 'rails_helper'

RSpec.describe Zombie, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name = "Zombie name"
    subject.turn_date = DateTime.now - 1.week
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a turn_date" do
    subject.name = "Zombie name"
    expect(subject).to_not be_valid
  end
end
