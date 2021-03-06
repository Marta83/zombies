RSpec.describe 'Search API', type: :request do
  before(:all){
    @zombie = create(:zombie, {turn_date: DateTime.now - 1.week})
    @zombie_equiped = create(:zombie_equiped, {turn_date: DateTime.now - 1.day})
  }

  describe 'GET /search' do

    context 'when the request is valid' do
      it 'search zombie by name' do
        get '/searches', params: { zombie_name: @zombie.name }

        expect(json.count).to eq(1)
        expect(json.first['name']).to eq(@zombie.name)
        expect(response).to have_http_status(200)
      end

      it 'search zombie by armor_id' do
        armor = @zombie_equiped.zombie_armors.first.armor
        get '/searches', params: { armor_id: armor.id }

        expect(json.count).to eq(1)
        expect(json.first['name']).to eq(@zombie_equiped.name)
        expect(response).to have_http_status(200)
      end

      it 'search zombie by weapon_id' do
        weapon = @zombie_equiped.zombie_weapons.first.weapon
        get '/searches', params: { weapon_id: weapon.id }

        expect(json.count).to eq(1)
        expect(json.first['name']).to eq(@zombie_equiped.name)
        expect(response).to have_http_status(200)
      end

      it 'search zombie by turn date greater than' do
        get '/searches', params: { turn_date_greater: @zombie.turn_date }

        expect(json.count).to eq(1)
        expect(json.first['name']).to eq(@zombie_equiped.name)
        expect(response).to have_http_status(200)
      end

      it 'search zombie by turn date lesser than' do
        get '/searches', params: { turn_date_lesser: @zombie_equiped.turn_date }

        expect(json.count).to eq(1)
        expect(json.first['name']).to eq(@zombie.name)
        expect(response).to have_http_status(200)
      end



    end

  end

end
