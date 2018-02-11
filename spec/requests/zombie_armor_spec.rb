require "rails_helper"
RSpec.describe 'Zombie armors API', type: :request do
  let!(:armor) { create(:armor) }
  let!(:zombie) { create(:zombie) }

  describe 'PUT /zombie_armors' do
    let(:valid_attributes) { { :zombie_id => zombie.id, :armor_id => armor.id } }
    let(:invalid_zombie_attributes) { { :zombie_id => 0, :armor_id => armor.id } }
    let(:invalid_armor_attributes) { { :zombie_id => zombie.id, :armor_id => 0 } }

    context 'when the request is valid' do

      it 'creates a zombie' do
        put zombie_armor_path(valid_attributes)
        expect(json['zombie_id']).to eq(zombie.id)
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do

      it 'returns status code 422' do
        put zombie_armor_path(invalid_armor_attributes)
        expect(response).to have_http_status(422)
      end

      it 'returns status code 422' do
        put zombie_armor_path(invalid_zombie_attributes)
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        put zombie_armor_path(invalid_armor_attributes)
        expect(response.body)
        .to match(/[\"Armor must exist\"]/)
      end

      it 'returns a validation failure message' do
        put zombie_armor_path(invalid_zombie_attributes)
        expect(response.body)
        .to match(/[\"Zombie must exist\"]/)
      end
    end
    end

  describe 'Delete /zombie_armors' do

    context 'when the request is valid' do

      it 'deleted zombie armor' do
        zombie = create(:zombie)
        armor = create(:armor)
        zombie_armor = create(:zombie_armor, zombie: zombie, armor: armor)
        valid_attributes = {zombie_id: zombie.id, armor_id: armor.id}

        expect{
          delete "/zombies/#{zombie.id}/armors/#{armor.id}"
        }.to change(ZombieArmor, :count).by(-1)
      end

    end

    context 'when the request is invalid' do

      it 'Zombie armor is not deleted' do
        attributes = build_stubbed(:zombie_armor)

        expect{
          delete "/zombies/#{attributes.zombie_id}/armors/#{attributes.armor_id}"
        }.to_not change(ZombieArmor, :count)
        expect(response).to have_http_status(404)
      end
    end

  end
end
