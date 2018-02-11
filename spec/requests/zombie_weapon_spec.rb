RSpec.describe 'Zombie weapons API', type: :request do
  let!(:weapon) { create(:weapon) }
  let!(:zombie) { create(:zombie) }

  describe 'PUT /zombie_weapons' do
    let(:valid_attributes) { { :zombie_id => zombie.id, :weapon_id => weapon.id } }
    let(:invalid_zombie_attributes) { { :zombie_id => 0, :weapon_id => weapon.id } }
    let(:invalid_weapon_attributes) { { :zombie_id => zombie.id, :weapon_id => 0 } }

    context 'when the request is valid' do
      before { put zombie_weapon_path(valid_attributes )}

      it 'creates a zombie' do
        expect(json['zombie_id']).to eq(zombie.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do

      it 'returns status code 422' do
        put zombie_weapon_path(invalid_weapon_attributes)
        expect(response).to have_http_status(422)
      end

      it 'returns status code 422' do
        put zombie_weapon_path(invalid_zombie_attributes)
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        put zombie_weapon_path(invalid_weapon_attributes)
        expect(response.body)
        .to match(/[\"Weapon must exist\"]/)
      end

      it 'returns a validation failure message' do
        put zombie_weapon_path(invalid_zombie_attributes)
        expect(response.body)
        .to match(/[\"Zombie must exist\"]/)
      end
    end
    end

  describe 'Delete /zombie_weapons' do

    context 'when the request is valid' do

      it 'deleted zombie weapon' do
        zombie = create(:zombie)
        weapon = create(:weapon)
        zombie_weapon = create(:zombie_weapon, zombie: zombie, weapon: weapon)
        valid_attributes = {zombie_id: zombie.id, weapon_id: weapon.id}

        expect{
          delete "/zombies/#{zombie.id}/weapons/#{weapon.id}"
        }.to change(ZombieWeapon, :count).by(-1)
      end

    end

    context 'when the request is invalid' do

      it 'Zombie weapon is not deleted' do
        attributes = build_stubbed(:zombie_weapon)

        expect{
          delete "/zombies/#{attributes.zombie_id}/weapons/#{attributes.weapon_id}"
        }.to_not change(ZombieWeapon, :count)
        expect(response).to have_http_status(404)
      end
    end

  end
end
