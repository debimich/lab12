require 'rails_helper'

RSpec.describe Value, type: :model do
  describe 'test definition' do
    let(:user) do
      user = User.new(nickname: 'ivan', password: 'Aqwerty123!', password_confirmation: 'Aqwerty123!')
      user.save!
      user
    end

    let(:definition) do
            user

            definition = Definition.new(User: user, def: 'Тест')
            definition.save!
            definition
        end

    context 'when valid data' do
      it 'returns success' do
        user
        definition

        value = Value.new(User: user, Definition: definition, val: 'Тест')
        expect(value.save).to eq true
      end

      it 'returns error message, exist мфдгу' do
        user
        definition

        value1 = Value.new(User: user, Definition: definition, val: 'Тест')
        value1.save
        value2 = Value.new(User: user, Definition: definition, val: 'Тест')
        value2.save

        expect(value2.errors.full_messages[0]).to eq 'Val Данное значение уже существует'
      end
    end

    context 'when invalid data' do
      it 'returns error message, empty value' do
        user
                definition

        value = Value.new(User: user, Definition: definition, val: '')
        value.save
        expect(value.errors.full_messages[0]).to eq 'Val Текст значения не может быть пустым'
      end

      it 'returns error message, empty user' do
                definition

        value = Value.new(User: nil, Definition: definition, val: 'Тест')
        value.save
        expect(value.errors.full_messages[0]).to eq 'User must exist'
      end

            it 'returns error message, empty definition' do
                user

        value = Value.new(User: user, Definition: nil, val: 'Тест')
        value.save
        expect(value.errors.full_messages[0]).to eq 'Definition must exist'
      end
    end
  end
end
