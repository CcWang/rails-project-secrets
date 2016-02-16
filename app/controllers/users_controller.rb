class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only:[:show, :edit, :update, :destroy]
  def show
    @user = User.find(params[:id])
     @secrets = @user.secrets
  end

  def new
    
  end

  def create
    if params[:password] == params[:password_confirmation]

      user= User.create(name:params[:name],email:params[:email],password:params[:password])
      if user.errors.any?
        flash[:errors] = user.errors.full_messages
        redirect_to '/users/new'
      else
        session[:user_id] = user.id
        redirect_to "/users/#{user.id}"       
      end
    else
      
      flash[:errors] = ['password does not match password confirmation']
      redirect_to '/users/new'
    end

  end

  def edit
    @user = User.find(params[:id])
    @secrets = @user.secrets
  end

  def update
    user = User.find(params[:id])
    user.update(name:params[:name])
    user.update(email:params[:email])
    redirect_to "/users/#{current_user.id}"   
  end

  def destroy
     # user = User.find(params[:id])
     User.destroy(params[:id])
     session[:user_id] = nil
     redirect_to :controller=>'sessions', :action=>'new'

  end

  # private
  # def get_user
  #   params.require(:user).permit(:name,:email,:password,:password_confirmation)
  # end
end
