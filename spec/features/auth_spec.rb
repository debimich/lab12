require 'rails_helper'

RSpec.describe 'user authentication', type: :feature do
  scenario 'valid registration' do
    visit new_user_path

    fill_in 'user[nickname]', with: 'sueta'
    fill_in 'user[password]', with: '1234'
    click_on :commit

    expect(User.find_by(nickname: 'sueta').present?).to eq true

    find('#exit_link').click
    visit new_session_path
    fill_in 'sessions[nickname]', with: 'sueta'
    fill_in 'sessions[password]', with: '1234'
    click_on :commit
  end
end
