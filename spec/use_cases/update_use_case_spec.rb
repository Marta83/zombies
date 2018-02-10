RSpec.describe 'Update use case' do

  describe 'Update a zombie' do

    let(:zombie) { create(:zombie)}
    let(:success){ lambda do |entity| return entity end}
    let(:error) { lambda do |error| return "error" end }
    let(:repository) { Repository.for(:zombie) }

    context "all ready" do
      let(:data) {{name: "Name changed" }}

      it 'should chamge zombie name' do
        zombie_oldname = zombie.name

        expect {
            UpdateUseCase.call(zombie, data , repository, {success: success, failure: error})
            zombie.reload
        }.to change{ zombie.name }.from(zombie_oldname).to(data[:name])
      end
    end

    context "not all ready" do
      let(:data) {{name: "Name changed", hit_points: "asdasdas" }}

      it 'should not change zombie name' do

        expect {
            UpdateUseCase.call(zombie, data , repository, {success: success, failure: error})
            zombie.reload
        }.to_not change{ zombie.name }
      end
    end

  end
end
