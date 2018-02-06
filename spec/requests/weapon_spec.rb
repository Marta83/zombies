RSpec.describe 'Weapons API', type: :request do

  describe 'POST /weapon' do
    let(:valid_attributes) { { name: 'Weapon name',
                               price: 50,
                               attack_points: 50,
                               durability: 50} }

    context 'when the request is valid' do
      before { post '/weapon', params: valid_attributes }

      it 'creates a weapon' do
        expect(json['name']).to eq('Weapon name')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/weapon', params: { name: 'Weapon name' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/Validation failed: Price can't be blank, Attack points can't be blank, Durability can't be blank/)
      end
    end
    end

end