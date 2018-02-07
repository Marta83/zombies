RSpec.describe 'Create use case' do

  describe 'Create a zombie' do

    entities = {:zombie =>  {name: 'Zombie name', turn_date: DateTime.now - 1.week  },
                :armor =>  { name: 'Armor name', price: 50, defense_points: 50, durability: 50 },
                :weapon =>  { name: 'Weapon name', price: 50, attack_points: 50, durability: 50}}

    callback = lambda do |entity| return entity end

    entities.each do |key, data|
      repository = Repository.for(key)

      context "Valid attributes" do
        let(:subject) { CreateUseCase.call(data , callback, repository) }

        it 'should call without errors' do
          expect { subject }.to_not raise_error
        end

        it 'should return zombie' do
          expect( subject.name ).to eq( data[:name] )
        end
      end

      context "Invalid attributes" do
        let(:subject_invalid) { CreateUseCase.call({ name: data[:name] } , callback, repository) }

        it 'should call without errors' do
          expect { subject_invalid }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end
