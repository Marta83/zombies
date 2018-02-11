require "rails_helper"
RSpec.describe 'Zombies API', type: :request do

  before(:all) {
    @attributes = attributes_for(:zombie)
  }

  describe 'POST /zombies' do
    context 'when the request is valid' do
      before(:all) {
        post '/zombies', params: @attributes
      }

      it 'creates a zombie' do
        expect(json['name']).to eq(@attributes[:name])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/zombies', params: { name: @attributes[:name] } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
        .to match(/[\"Turn date can't be blank\"]/)
      end
    end

    context 'when the request params are invalid' do

      before(:all) {
        attributes = attributes_for(:zombie, hit_points: 'asdasdasd')
        post '/zombies', params: attributes
      }

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

      it 'update zombie name' do
        expect(json['name']).to eq('Zombie name changed')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before(:all) {
        attributes = build_stubbed(:zombie)
        put zombie_path(attributes)
      }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body).to eq("{\"error\":\"Zombie not found\"}")
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
        expect(response.body).to eq("{\"error\":[\"Hit points is not a number\"]}")
      end
    end

  end

  describe 'Delete /zombies' do

    context 'when the request is valid' do

      it 'deleted zombie name' do
        zombie = create(:zombie)
        valid_attributes = {id: zombie.id}

        expect{
          delete zombie_path(valid_attributes)
        }.to change(Zombie, :count).by(-1)
      end

      it 'dependent destroy' do
        zombie = create(:zombie_equiped)
        valid_attributes = {id: zombie.id}

        expect{
          delete zombie_path(valid_attributes)
        }.to change(ZombieArmor, :count).by(-1)
        .and change(ZombieWeapon, :count).by(-1)

      end
    end

    context 'when the request is invalid' do

      it 'Zombie is not deleted' do
        attributes = build_stubbed(:zombie)

        expect{
          delete zombie_path(attributes)
        }.to_not change(Zombie, :count)
        expect(response).to have_http_status(404)
      end
    end

  end

end
