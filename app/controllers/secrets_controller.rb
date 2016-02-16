class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
    @secrets = Secret.all
  end

  def create
    # user = User.find(session[:user_id])
    secret = current_user.secrets.new(content:params[:secret])
    if secret.save
      redirect_to "/users/#{current_user.id}"
      # redirect_to :controller =>'users', :action=>'show', :id =>current_user.id
    else
      flash[:errors] = secret.errors.fullmessages
      redirect_to :back
    end
  end

  def destroy
    s = Secret.find(params[:id])
    s.destroy if s.user == current_user
    redirect_to "/users/#{current_user.id}"
  end
end
