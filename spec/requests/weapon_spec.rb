RSpec.describe 'Weapons API', type: :request do

  describe 'POST /weapons' do
    let(:valid_attributes) { { name: 'Weapon name',
                               price: 50,
                               attack_points: 50,
                               durability: 50} }

    context 'when the request is valid' do
      before { post '/weapons', params: valid_attributes }

      it 'creates a weapon' do
        expect(json['name']).to eq('Weapon name')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/weapons', params: { name: 'Weapon name' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/[\"Price can't be blank\",\"Attack points can't be blank\",\"Durability can't be blank\"]/)
      end
    end

    context 'when the request params are invalid' do
      let(:attributes) { { name: 'Weapon name',
                           price: "asdasd",
                           attack_points: 50,
                           durability: 50} }

      before { post '/weapons', params: attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/[\"Price is not a number\"]/)
      end
    end
  end

  describe 'PUT /weapons' do

    context 'when the request is valid' do
      before(:all) {
        weapon = create(:weapon)
        valid_attributes = {  id: weapon.id, name: 'Weapon name changed'}
        put weapon_path(valid_attributes)
      }

      it 'update weapon name' do
        expect(json['name']).to eq('Weapon name changed')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before(:all) {
        attributes = build_stubbed(:weapon)
        put weapon_path(attributes)
      }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body).to eq("{\"error\":\"Weapon not found\"}")
      end
    end

    context 'when the request params ar not invalid' do
      before(:all) {
        weapon = create(:weapon)
        attributes = {id: weapon.id, name: 'Weapon name changed', attack_points: "asdasd"}
        put weapon_path(attributes)
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to eq("{\"error\":[\"Attack points is not a number\"]}")
      end
    end

  end
end
