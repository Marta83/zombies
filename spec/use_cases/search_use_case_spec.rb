RSpec.describe 'Search use case' do

  describe 'Search zombies' do

      success = lambda do |entities| return entities end
      error = lambda do |error| return "error" end

      repository = Repository.for(:zombie)

      context "Entity is searched" do
        let(:zombies) { [build_stubbed(:zombie), build_stubbed(:zombie)] }

        it 'should return search' do
          expect(repository).to receive(:filter).and_return(zombies)

          search = SearchUseCase.call({zombie_name: "Zombie name"} , repository, {success: success, failure: error})

          expect(search).to eq(zombies)
        end
      end
  end
end
