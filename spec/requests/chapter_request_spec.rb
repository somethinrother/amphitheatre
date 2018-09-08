require 'rails_helper'

RSpec.describe 'Chapter requests', :type => :request do

  describe 'GET /chapters/:id.json' do

    context 'when the request is valid' do
      it "can render a chapter's information" do
        chapter = create(:chapter)
        get "/chapters/#{chapter.id}.json"
        hash_body = nil

        expect {hash_body = JSON.parse(response.body).with_indifferent_access}.not_to raise_exception
        expect(hash_body['data']['attributes']).to match_array(
          [
            ['title', chapter.title],
            ['description', chapter.description],
          ]
        )
        expect(hash_body['data']['relationships'].keys).to match_array(["blue-books", "campaign"])
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST /chapters' do
    let(:campaign) { create(:campaign, id: 1) }

    context 'when the request is valid' do
      it "can create a chapter" do
        campaign
        json_helper = Helpers::JSON.new('chapter')
        headers = json_helper.json_headers
        successful_post = json_helper.successful_post
        post chapters_path, params: successful_post, headers: headers
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(response.status).to eq(201)
      end
    end
  end
end
