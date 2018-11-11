require 'rails_helper'

RSpec.describe 'Location requests', :type => :request do
  hash_body = nil

  describe 'GET requests to' do
    context '/locations.json' do
      it 'returns the information of all locations' do
        location_a = create(:location)
        location_b = create(:location)
        get '/locations.json'

        expect {
          hash_body = JSON.parse(response.body).with_indifferent_access
        }.not_to raise_exception
        data = hash_body['data']
        expect(data.first['attributes']).to match(
          {
            'name': location_a.name,
            'description': location_a.description,
          }
        )
        expect(data.second['attributes']).to match(
          {
            'name': location_b.name,
            'description': location_b.description
          }
        )
        expect(data.first['relationships'].keys).to match_array(['campaign'])
        expect(data.second['relationships'].keys).to match_array(['campaign'])
        expect(response.status).to eq(200)
      end
    end

    context '/locations/:id.json' do
      it 'returns the information of one location' do
        location = create(:location)
        get "/locations/#{location.id}.json"

        expect {
          hash_body = JSON.parse(response.body).with_indifferent_access
        }.not_to raise_exception
        expect(hash_body['data']['attributes']).to match(
          {
            'name': location.name,
            'description': location.description
          }
        )
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST /locations' do
    let(:campaign) { create(:campaign, id: 1) }

    context 'when the request is valid' do
      it "can create a location" do
        campaign
        json_helper = JsonHelper.new('locations')
        post locations_path,
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
    let(:location) { create(:location, id: 1, name: 'Super cool name', description: 'Wow') }
    let(:campaign) { create(:campaign, id: 1) }

    context 'when the request is valid' do
      it 'updates the location' do
        campaign
        location
        json_helper = JsonHelper.new('locations')
        put location_path(location),
          params: json_helper.successful_put(location.id),
          headers: json_helper.json_headers

        expect {
          hash_body = JSON.parse(response.body).with_indifferent_access
        }.not_to raise_exception
        data = hash_body['data']
        attributes = data['attributes']
        expect(data['id']).to eq(location.id.to_s)
        expect(attributes['name']).to eq('name')
        expect(attributes['description']).to eq('description')
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'DELETE requests' do
    let(:location) { create(:location) }

    context 'when the request is valid' do
      it 'deletes the location' do
        location
        expect(Location.all.length).to eq(1)
        json_helper = JsonHelper.new('locations')
        headers = json_helper.json_headers
        delete location_path(location), headers: headers

        expect(Location.all.length).to eq(0)
        expect(response.status).to eq(204)
      end
    end
  end
end
