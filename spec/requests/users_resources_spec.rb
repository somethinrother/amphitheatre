require 'rails_helper'

RSpec.describe 'User resources', :type => :request do

  it "can render a user's information" do
    create(:user)
    user = User.find(1)
    byebug
    JSONAPI::ResourceSerializer.new(UserResource).serialize_to_hash(user)
    get '/users/1'
    expect(response).to eq('')
  end
end
