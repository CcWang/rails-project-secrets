require 'rails_helper'
RSpec.describe 'logging out' do
 before do
  @user = create_user
  log_in @user
 end

 it 'display "Log Out" button when user is logged on' do
  expect(page).to have_button("Log Out")
 end

 it 'logs user out and redriect to log in page' do
  click_button 'Log Out'
  # session[:user_id] = nil
  expect(current_path).to eq('/sessions/new')
 end
end