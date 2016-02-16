require 'rails_helper'
RSpec.describe 'signing up' do
  it 'prompts for valid fields' do
    visit '/users/new'
    expect(page).to have_text("Email")
    expect(page).to have_text("Name")
    expect(page).to have_text('Password')
    expect(page).to have_text('Password Confirmation')
  end

end