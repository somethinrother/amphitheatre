require 'rails_helper'

RSpec.describe 'Campaign requests', :type => :request do

  describe 'GET /campaigns/:id.json' do

    context 'when the request is valid' do
      it "can render a campaign's information" do
        campaign = create(:campaign)
        get "/campaigns/#{campaign.id}.json"
        hash_body = nil

        expect {hash_body = JSON.parse(response.body).with_indifferent_access}.not_to raise_exception
        expect(hash_body['data']['attributes']).to match_array([['title', campaign.title], ['description', campaign.description]])
        expect(hash_body['data']['attributes']).to match({ 'title': campaign.title, 'description': campaign.description })
        expect(hash_body['data']['relationships'].keys).to match_array(['user', 'setting-details', 'chapters', 'characters'])
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST /campaigns' do
    let(:user) { create(:user) }
    let(:headers) do
      { "ACCEPT": "application/vnd.api+json", "CONTENT_TYPE": "application/vnd.api+json" }
    end
    let(:valid_attributes) do
      '{ "data": { "type": "campaigns", "relationships": { "user": { "data": { "type": "users", "id": "1" } } }, "attributes": { "title": "Fake Title", "description": "Pretty Awesome" } } }'
    end

    context 'when the request is valid' do
      it "can create a campaign" do
        user.id = 1
        user.save
        post campaigns_path, params: valid_attributes, headers: headers
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(response.status).to eq(201)
      end
    end
  end
end