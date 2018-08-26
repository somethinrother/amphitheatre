class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    serializer = JSONAPI::ResourceSerializer.new(UserResource)
    hash = serializer.serialize_to_hash(UserResource.new(@user, nil))
    render json: hash
  end
end
