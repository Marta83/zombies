RSpec.describe 'Armors API', type: :request do

  describe 'POST /armor' do
    let(:valid_attributes) { { name: 'Armor name',
                               price: 50,
                               defense_points: 50,
                               durability: 50} }

    context 'when the request is valid' do
      before { post '/armor', params: valid_attributes }

      it 'creates a armor' do
        expect(json['name']).to eq('Armor name')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/armor', params: { name: 'Armor name' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/Validation failed: Price can't be blank, Defense points can't be blank, Durability can't be blank/)
      end
    end
    end

end
