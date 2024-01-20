require 'rails_helper'

RSpec.describe 'user authentication', type: :feature do
  scenario 'valid registration' do
    visit new_user_path

    fill_in 'user[nickname]', with: 'sueta'
    fill_in 'user[password]', with: '1234'
    click_on :commit

    expect(User.find_by(nickname: 'sueta').present?).to eq true

    find('#exit_link').click

    fill_in 'sessions[nickname]', with: 'sueta'
    fill_in 'sessions[password]', with: '1234'
    click_on :commit

    fill_in "sqrt_text", with: '2'
    find('#submit').click

    expect(find('#value_1')).to have_text('1.5')
    expect(find('#value_2')).to have_text('1.4166666666666665')
    expect(find('#value_3')).to have_text('1.4142156862745097')
  end

  scenario 'check login' do
    visit root_path

    expect(page).to have_content('Необходима авторизация')

    visit '/sqrt/input'

    expect(page).to have_content('Необходима авторизация')
  end
end
