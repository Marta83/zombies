RSpec.describe 'Equip use case' do

  describe 'Equip a zombie' do

      let(:zombie) { create(:zombie)}
      let(:success){ lambda do |entity| return entity end}
      let(:error) { lambda do |error| return "error" end }

    describe 'Equip a zombie with an armor' do
      let(:repository) { Repository.for(:zombie_armor) }
      let(:armor) { create(:armor) }

      context "all ready" do
        let(:data) {{ zombie_id: zombie.id, armor_id: armor.id }}
        let(:zombie_armor) { double(ZombieArmor, data  )}

        it 'should equip zombie with an armor' do
          expect(repository).to receive(:new_entity).and_return(zombie_armor)
          expect(repository).to receive(:save).and_return(true)

          equiped = EquipUseCase.call(data , repository, {success: success, failure: error})
          expect(equiped).to eq(zombie_armor)
        end
      end

      context "not all ready" do
        let(:entity) { double(ZombieArmor).as_null_object }

        it 'should error' do
          expect(repository).to receive(:new_entity).and_return(entity)
          expect(repository).to receive(:save)
          expect(repository).to receive(:errors)

          equiped = EquipUseCase.call({} , repository, {success: success, failure: error})
          expect(equiped).to eq(error.call(equiped))
        end
      end
    end

    describe 'Equip a zombie with a weapon' do
      let(:repository) { Repository.for(:zombie_weapon) }
      let(:weapon) { create(:weapon) }

      context "all ready" do
        let(:data) {{ zombie_id: zombie.id, weapon_id: weapon.id }}
        let(:zombie_weapon) { double(ZombieWeapon, data)}

        it 'should equip zombie with a weapon' do
          expect(repository).to receive(:new_entity).and_return(zombie_weapon)
          expect(repository).to receive(:save).and_return(true)

          equiped = EquipUseCase.call(data , repository, {success: success, failure: error})
          expect(equiped).to eq(zombie_weapon)
        end
      end

      context "not all ready" do
        let(:zombie_weapon) { double(ZombieWeapon).as_null_object }

        it 'should error' do
          expect(repository).to receive(:new_entity).and_return(:zombie_weapon)
          expect(repository).to receive(:save)
          expect(repository).to receive(:errors)

          equiped = EquipUseCase.call({} , repository, {success: success, failure: error})
          expect(equiped).to eq(error.call(equiped))
        end
      end
    end
  end
end
