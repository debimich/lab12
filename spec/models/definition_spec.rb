require 'rails_helper'

RSpec.describe Definition, type: :model do
  describe 'test definition' do
    let(:user) do
      user = User.new(nickname: 'ivan', password: 'Aqwerty123!', password_confirmation: 'Aqwerty123!')
      user.save!
      user
    end

    context 'when valid data' do
      it 'returns success' do
        user

        definition = Definition.new(User: user, def: 'Тест')
        definition.save
        expect(definition.save).to eq true
      end

      it 'returns error message, exist definition' do
        user

        definition = Definition.new(User: user, def: 'Тест')
        definition.save
        definition = Definition.new(User: user, def: 'Тест')
        definition.save
        expect(definition.errors.full_messages[0]).to eq 'Def Данное определение уже существует'
      end
    end

    context 'when invalid data' do
      it 'returns error message, empty definition' do
        user

        definition = Definition.new(User: user, def: '')
        definition.save
        expect(definition.errors.full_messages[0]).to eq 'Def Текст определения не может быть пустым'
      end

      it 'returns error message, empty user' do
        user

        definition = Definition.new(User: nil, def: 'Тест')
        definition.save
        expect(definition.errors.full_messages[0]).to eq 'User must exist'
      end
    end
  end
end
