# Controls the api responses for users
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    hash = JsonSerializer.provide_hash(UserResource, @user)
    render json: hash
  end

  def new
    @user = User.new
  end

  def update; end

  def destroy; end
end
