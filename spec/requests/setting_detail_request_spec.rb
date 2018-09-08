require 'rails_helper'

RSpec.describe 'Setting Detail requests', :type => :request do

  describe 'GET /setting-details/:id.json' do

    context 'when the request is valid' do
      it "can render a setting detail's information" do
        setting_detail = create(:setting_detail)
        get "/setting-details/#{setting_detail.id}.json"
        hash_body = nil

        expect {hash_body = JSON.parse(response.body).with_indifferent_access}.not_to raise_exception
        expect(hash_body['data']['attributes']).to match_array(
          [
            ['title', setting_detail.title],
            ['description', setting_detail.description],
          ]
        )
        expect(hash_body['data']['attributes']).to match(
          {
            'title': setting_detail.title,
            'description': setting_detail.description
          }
        )
        expect(hash_body['data']['relationships'].keys).to match_array(['campaign'])
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST /setting-details' do
    let(:campaign) { create(:campaign, id: 1) }

    context 'when the request is valid' do
      it "can create a setting detail" do
        campaign
        json_helper = Helpers::JSON.new('setting_detail')
        headers = json_helper.json_headers
        successful_post = json_helper.successful_post
        post setting_details_path, params: successful_post, headers: headers
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(response.status).to eq(201)
      end
    end
  end
end
