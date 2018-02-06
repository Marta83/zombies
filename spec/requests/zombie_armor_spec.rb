RSpec.describe 'Zombie armors API', type: :request do
  let!(:armor) { create(:armor) }
  let!(:zombie) { create(:zombie) }

  describe 'PUT /zombie_armors' do
    let(:valid_attributes) { { :zombie_id => zombie.id, :armor_id => armor.id } }
    let(:invalid_zombie_attributes) { { :zombie_id => 0, :armor_id => armor.id } }
    let(:invalid_armor_attributes) { { :zombie_id => zombie.id, :armor_id => 0 } }

    context 'when the request is valid' do
      before { put zombie_armor_path(valid_attributes )}

      it 'creates a zombie' do
        expect(json['zombie_id']).to eq(1)
      end

      it 'returns status code 201' do
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
        .to match(/Validation failed: Armor must exist/)
      end

      it 'returns a validation failure message' do
        put zombie_armor_path(invalid_zombie_attributes)
        expect(response.body)
        .to match(/Validation failed: Zombie must exist/)
      end
    end
    end

end
