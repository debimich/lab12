require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test user' do
    let(:second_user) do
      second_user = User.new(nickname: 'ivan', password: 'Aqwerty123!', password_confirmation: 'Aqwerty123!')
      second_user.save!
    end

    context 'when valid data' do
      it 'returns success' do
        user = User.new(nickname: 'ivan', password: 'Aa123!', password_confirmation: 'Aa123!')

        expect(user.save).to eq true
      end

      it 'returns error message, exist nickname' do
        second_user

        user = User.new(nickname: 'ivan', password: 'Aa123!', password_confirmation: 'Aa123!')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Nickname Данный никнейм уже занят'
      end
    end
  end
end
