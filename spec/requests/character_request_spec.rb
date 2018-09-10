require 'rails_helper'

RSpec.describe 'Character requests', :type => :request do

  describe 'GET requests to' do
    context '/characters.json' do
      it 'returns the information of all characters' do
        character_a = create(:character)
        character_b = create(:character)
        get "/characters.json"
        hash_body = nil

        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(hash_body['data'].length).to eq(2)
        expect(hash_body['data'].first['attributes']).to match(
          {
            'name': character_a.name,
            'description': character_a.description,
            'pc-class': character_a.pc_class,
            'level': character_a.level
          }
        )
        expect(hash_body['data'].second['attributes']).to match(
          {
            'name': character_b.name,
            'description': character_b.description,
            'pc-class': character_b.pc_class,
            'level': character_b.level
          }
        )
      end
    end

    context '/characters/:id.json' do
      it "renders a characters's information" do
        character = create(:character)
        get "/characters/#{character.id}.json"
        hash_body = nil

        expect {hash_body = JSON.parse(response.body).with_indifferent_access}.not_to raise_exception
        expect(hash_body['data']['attributes']).to match_array(
          [
            ['name', character.name],
            ['description', character.description],
            ['level', character.level],
            ['pc-class', character.pc_class],
          ]
        )
        expect(hash_body['data']['attributes']).to match(
          {
            'name': character.name,
            'description': character.description,
            'pc-class': character.pc_class,
            'level': character.level
          }
        )
        expect(hash_body['data']['relationships'].keys).to match_array(['blue-books', 'campaign', 'user'])
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST requests' do
    let(:campaign) { create(:campaign, id: 1) }
    let(:user) { create(:user, id: 1) }

    context 'when the request is valid' do
      it "can create a character" do
        campaign
        user
        json_helper = Helpers::JSON.new('character')
        headers = json_helper.json_headers
        successful_post = json_helper.successful_post
        post characters_path, params: successful_post, headers: headers
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(response.status).to eq(201)
      end
    end
  end

  describe 'PUT requests' do
    let(:character) { create(:character, name: 'Bobo', description: 'So brave', pc_class: 'Fighter', level: 3) }
    let(:campaign) { create(:campaign, id: 1) }
    let(:user) { create(:user, id: 1) }

    context 'when the request is valid' do
      it 'updates the character' do
        campaign
        user
        character
        json_helper = Helpers::JSON.new('character')
        headers = json_helper.json_headers
        successful_put = json_helper.successful_put(character.id)
        patch "/characters/#{character.id}", params: successful_put, headers: headers
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(hash_body["data"]["id"]).to eq(character.id.to_s)
        expect(hash_body["data"]["attributes"]["name"]).to eq('name')
        expect(hash_body["data"]["attributes"]["description"]).to eq('description')
        expect(hash_body["data"]["attributes"]["pc-class"]).to eq('class')
        expect(hash_body["data"]["attributes"]["level"]).to eq(1)
        expect(response.status).to eq(200)
      end
    end
  end
end
