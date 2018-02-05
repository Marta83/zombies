RSpec.describe 'Zombies API', type: :request do

  describe 'POST /zombie' do
    let(:valid_attributes) { { name: 'Zombie name', turn_date: DateTime.now - 1.week  } }

    context 'when the request is valid' do
      before { post '/zombie', params: valid_attributes }

      it 'creates a zombie' do
        expect(json['name']).to eq('Zombie name')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/zombie', params: { name: 'Zombie name' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/Validation failed: Turn date can't be blank/)
      end
    end
    end

end
