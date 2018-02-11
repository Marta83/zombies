RSpec.describe 'Semantic search use case' do

  describe 'Semantic search for zombies' do

      success = lambda do |entitys| return entitys end
      error = lambda do |error| return "error" end

      repository = Repository.for(:zombie)

      context "Entity is searched" do
        let(:zombies) { [build_stubbed(:zombie), build_stubbed(:zombie)] }

        it 'should return search' do
          expect(repository).to receive(:search).and_return(zombies)
          search = SemanticSearchUseCase.call("search" , repository, {success: success, failure: error})
          expect(search).to eq(zombies)
        end
      end
  end
end
