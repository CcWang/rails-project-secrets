require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @user = create_user
    session[:user_id] = nil
    @secret = @user.secrets.create(content: "secret")
  end
  describe "when not logged in" do
    it "cannot access secrets" do
    post :create, id: @secret
    expect(response).to redirect_to('/sessions/new')
    end
  end

end
