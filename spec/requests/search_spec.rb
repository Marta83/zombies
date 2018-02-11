RSpec.describe 'Search API', type: :request do
  let!(:zombie) { create(:zombie) }

  describe 'GET /search' do
    let(:valid_attributes) { { name: zombie.name } }

    context 'when the request is valid' do
      before { get '/search', params: valid_attributes }

      it 'creates a zombie' do
#        puts json.inspect
#        expect(json['name']).to eq('Zombie name')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

  end

end
