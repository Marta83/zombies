RSpec.describe 'Create use case' do
  subject { CreateUseCase.call(attributes, callback, repository) }

  let(:callback) { lambda do |entity| return entity end}
  let(:repository){Repository.for(entity)}

  describe 'Create a zombie' do
    let(:entity){:zombie}

    context "Valid attributes" do
      let(:attributes) { { name: 'Zombie name', turn_date: DateTime.now - 1.week  } }

      it 'should call without errors' do
        expect { subject }.to_not raise_error
      end

      it 'should return zombie' do
        expect( subject.name ).to eq("Zombie name")
      end
    end

    context "Invalid attributes" do
      let(:attributes) { { name: 'Zombie name'} }

      it 'should call without errors' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe 'Create a Armor' do
    let(:entity){:armor}

    context "Valid attributes" do
      let(:attributes) { { name: 'Armor name',
                           price: 50,
                           defense_points: 50,
                           durability: 50} }

      it 'should call without errors' do
        expect { subject }.to_not raise_error
      end

      it 'should return armor' do
        expect( subject.name ).to eq("Armor name")
      end
    end

    context "Invalid attributes" do
      let(:attributes) { { name: 'armor name'} }

      it 'should call without errors' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe 'Create a Weapon' do
    let(:entity){:weapon}

    context "Valid attributes" do
      let(:attributes) { { name: 'Weapon name',
                           price: 50,
                           attack_points: 50,
                           durability: 50} }

      it 'should call without errors' do
        expect { subject }.to_not raise_error
      end

      it 'should return weapon' do
        expect( subject.name ).to eq("Weapon name")
      end
    end

    context "Invalid attributes" do
      let(:attributes) { { name: 'Weapon name'} }

      it 'should call without errors' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
