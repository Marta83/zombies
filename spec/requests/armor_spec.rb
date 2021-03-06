RSpec.describe 'Armors API', type: :request do

  before(:all) {
    @attributes = attributes_for(:armor)
  }

  describe 'POST /armors' do

    context 'when the request is valid' do
      before(:all) {
        post '/armors', params: @attributes
      }

      it 'creates a armor' do
        expect(json['name']).to eq(@attributes[:name])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/armors', params: { name: @attributes[:name] } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/[\"Price can't be blank\",\"Defense points can't be blank\",\"Durability can't be blank\"]/)
      end
    end

    context 'when the request params are invalid' do
      before(:all) {
        attributes = attributes_for(:armor, price: 'asdasdasd')
        post '/armors', params: attributes
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/[\"Price is not a number\"]/)
      end
    end
  end

  describe 'PUT /armors' do

    context 'when the request is valid' do
      before(:all) {
        armor = create(:armor)
        valid_attributes = {  id: armor.id, name: 'Armor name changed'}
        put armor_path(valid_attributes)
      }

      it 'update armor name' do
        expect(json['name']).to eq('Armor name changed')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before(:all) {
        attributes = build_stubbed(:weapon)
        put armor_path(attributes)
      }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body).to eq("{\"error\":\"Armor not found\"}")
      end
    end

    context 'when the request params ar not invalid' do
      before(:all) {
        armor = create(:armor)
        attributes = {id: armor.id, name: 'Zombie name changed', defense_points: "asdasd"}
        put armor_path(attributes)
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to eq("{\"error\":[\"Defense points is not a number\"]}")
      end
    end

  end
end
