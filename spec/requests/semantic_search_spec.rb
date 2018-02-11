RSpec.describe 'Semantic Search API', type: :request do

  before(:all){
    @zombie = create(:zombie_equiped)
    @zombie2 = create(:zombie_equiped)
  }

  describe 'GET /semantic_search' do

    context 'when the request is not valid' do

      it 'should return error when query parameter is not present' do
        get '/semantic_searches', params: { }

        expect(response.body).to eq("{\"error\":\"Parameter not found\"}")
      end
    end

    context 'when the request is valid' do

      it 'Finds a zombie by name' do

        get '/semantic_searches', params: { q: @zombie.name }

        expect(json.count).to eq(1)
        expect(json.first["name"]).to eq(@zombie.name)
      end

      it 'Finds a zombie by armor name' do

        armor = @zombie.zombie_armors.first.armor
        get '/semantic_searches', params: { q: armor.name }

        expect(json.count).to eq(1)
        expect(json.first["name"]).to eq(@zombie.name)
      end

      it 'Finds a zombie by armor name when armor name is updated' do
        armor = @zombie.zombie_armors.first.armor
        update(armor, 'name', "updated name")

        get '/semantic_searches', params: { q: "updated name" }

        expect(json.count).to eq(1)
        expect(json.first["name"]).to eq(@zombie.name)
      end

      it 'Finds a zombie by weapon name' do

        weapon = @zombie.zombie_weapons.first.weapon

        get '/semantic_searches', params: { q: weapon.name }

        expect(json.count).to eq(1)
        expect(json.first["name"]).to eq(@zombie.name)
      end

      it 'Finds a zombie by weapon name when weapon name is updated' do
        weapon = @zombie.zombie_weapons.first.weapon
        update(weapon, 'name', "updated name")

        get '/semantic_searches', params: { q: weapon.name }

        expect(json.count).to eq(1)
        expect(json.first["name"]).to eq(@zombie.name)
      end

    end

  end

end
