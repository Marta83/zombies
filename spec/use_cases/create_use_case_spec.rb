RSpec.describe 'Create use case' do

  describe 'Create a entity' do

    classes = {:zombie => Zombie, :armor => Armor, :weapon => Weapon}
    entities = {:zombie =>  {name: 'Zombie name', turn_date: DateTime.now - 1.week  },
                :armor =>  { name: 'Armor name', price: 50, defense_points: 50, durability: 50 },
                :weapon =>  { name: 'Weapon name', price: 50, attack_points: 50, durability: 50}}


    success = lambda do |entity| return entity end
    error = lambda do |error| return "error" end

    entities.each do |key, data|
      repository = Repository.for(key)

      context "Entity is created" do
        let(:entity) { double(classes[key], data  )}

        it 'should return created entity' do
          expect(repository).to receive(:new_entity).and_return(entity)
          expect(repository).to receive(:save).and_return(entity)

          created = CreateUseCase.call(data , repository, {success: success, failure: error})
          expect(created).to eq(entity)
        end
      end

      context "Entity is not created" do
        let(:entity) { double(classes[key]).as_null_object }

        it 'should return callback error' do
          expect(repository).to receive(:new_entity).and_return(entity)
          expect(repository).to receive(:save)
          created = CreateUseCase.call({name: 'Entity name'} , repository, {success: success, failure: error})

          expect(created).to eq(error.call(created))
        end
      end
    end
  end
end
