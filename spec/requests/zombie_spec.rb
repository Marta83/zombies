RSpec.describe 'Zombies API', type: :request do

  describe 'POST /zombies' do
    let(:valid_attributes) { { name: 'Zombie name', turn_date: DateTime.now - 1.week  } }

    context 'when the request is valid' do
      before { post '/zombies', params: valid_attributes }

      it 'creates a zombie' do
        expect(json['name']).to eq('Zombie name')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/zombies', params: { name: 'Zombie name' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/[\"Turn date can't be blank\"]/)
      end
    end

    context 'when the request params are invalid' do
    let(:attributes) { { name: 'Zombie name', turn_date: DateTime.now - 1.week, hit_points: "asasdas"  } }

      before { post '/zombies', params: attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/[\"Hit points is not a number\"]/)
      end
    end
  end

  describe 'PUT /zombies' do

    context 'when the request is valid' do
      before(:all) {
        zombie = create(:zombie)
        valid_attributes = {id: zombie.id, name: 'Zombie name changed'}
        put zombie_path(valid_attributes)
      }

      it 'creates a zombie' do
        expect(json['name']).to eq('Zombie name changed')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before(:all) {
        attributes = {id: 1, name: 'Zombie name changed'}
        put zombie_path(attributes)
      }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body).to eq("Zombie not found")
      end
    end

    context 'when the request params ar not invalid' do
      before(:all) {
        zombie = create(:zombie)
        attributes = {id: zombie.id, name: 'Zombie name changed', hit_points: "asdasd"}
        put zombie_path(attributes)
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to eq("[\"Hit points is not a number\"]")
      end
    end

  end

end
