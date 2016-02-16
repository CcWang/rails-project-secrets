class LikesController < ApplicationController
  before_action :require_login
  def create
    s = Secret.find(params[:id])
    Like.create(user:current_user, secret:s)
    redirect_to "/secrets"
  end

  def destroy
    user_like = Like.where("user_id = #{current_user.id}")
    secret = user_like.where("secret_id = #{params[:id]}")
    Like.destroy(secret.pluck('id'))
    redirect_to "/secrets"
  end
end
