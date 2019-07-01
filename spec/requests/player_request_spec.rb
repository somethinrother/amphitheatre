require 'rails_helper'

RSpec.describe 'Player requests', :type => :request do
  hash_body = nil

  describe 'GET requests to' do
    context '/players.json' do
      it 'returns the information of all players' do
        player_a = create(:player)
        player_b = create(:player)
        get "/players.json"

        expect {
          hash_body = JSON.parse(response.body).with_indifferent_access
        }.not_to raise_exception
        data = hash_body['data']
        expect(data.length).to eq(2)
        expect(data.first['attributes']).to match(
          {
            'role': player_a.role
          }
        )
        expect(data.second['attributes']).to match(
          {
            'role': player_b.role
          }
        )
        expect(response.status).to eq(200)
      end

      context '/players/:id.json' do
        it 'returns the information of one player' do
          player = create(:player)
          get "/players/#{player.id}.json"

          expect {
            hash_body = JSON.parse(response.body).with_indifferent_access
          }.not_to raise_exception
          expect(hash_body['data']['attributes']).to match(
            {
              'name': player.role
            }
          )
          expect(response.status).to eq(200)
        end
      end
    end

    context '/players/:id.json' do
      it "renders a players's information" do
        player = create(:player)
        get "/players/#{player.id}.json"

        expect {
          hash_body = JSON.parse(response.body).with_indifferent_access
        }.not_to raise_exception
        data = hash_body['data']
        expect(data['attributes']).to match_array(
          [
            ['role', player.role]
          ]
        )
        expect(data['attributes']).to match(
          {
            'role': player.role
          }
        )
        expect(data['relationships'].keys).to match_array(['campaign', 'user'])
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST requests' do
    let(:campaign) { create(:campaign, id: 1) }
    let(:user) { create(:user, id: 1) }

    context 'when the request is valid' do
      it "can create a player" do
        campaign
        user
        json_helper = JsonHelper.new('players')
        post players_path,
          params: json_helper.successful_post,
          headers: json_helper.json_headers

        expect {
          hash_body = JSON.parse(response.body).with_indifferent_access
        }.not_to raise_exception
        expect(response.status).to eq(201)
      end
    end
  end

  describe 'PUT requests' do
    let(:player) { create(:player, id: 1, role: 'GM') }
    let(:campaign) { create(:campaign, id: 1) }
    let(:user) { create(:user, id: 1) }

    context 'when the request is valid' do
      it 'updates the player' do
        campaign
        user
        player
        json_helper = JsonHelper.new('players')
        headers = json_helper.json_headers
        successful_put = json_helper.successful_put(player.id)
        put player_path(player),
          params: json_helper.successful_put(player.id),
          headers: json_helper.json_headers

        expect {
          hash_body = JSON.parse(response.body).with_indifferent_access
        }.not_to raise_exception
        data = hash_body["data"]
        attributes = data["attributes"]
        expect(data["id"]).to eq(player.id.to_s)
        expect(attributes["role"]).to eq('role')
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'DELETE requests' do
    let(:player) { create(:player) }

    context 'when the request is valid' do
      it 'deletes the player' do
        player
        expect(Player.all.length).to eq(1)
        json_helper = JsonHelper.new('players')
        headers = json_helper.json_headers
        delete player_path(player), headers: headers

        expect(Player.all.length).to eq(0)
        expect(response.status).to eq(204)
      end
    end
  end
end
