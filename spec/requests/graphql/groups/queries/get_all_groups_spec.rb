require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'groups' do
    it 'can query all existing groups' do
      create_list(:group, 4)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)

      expect(result["data"]["allGroups"].count).to eq(4)
      expect(result["data"]["allGroups"][0]).to have_key("id")
      expect(result["data"]["allGroups"][0]).to have_key("name")
      expect(result["data"]["allGroups"][0]).to have_key("description")
      expect(result["data"]["allGroups"][1]).to have_key("id")
      expect(result["data"]["allGroups"][1]).to have_key("name")
      expect(result["data"]["allGroups"][1]).to have_key("description")
      expect(result["data"]["allGroups"][2]).to have_key("id")
      expect(result["data"]["allGroups"][2]).to have_key("name")
      expect(result["data"]["allGroups"][2]).to have_key("description")
      expect(result["data"]["allGroups"][3]).to have_key("id")
      expect(result["data"]["allGroups"][3]).to have_key("name")
      expect(result["data"]["allGroups"][3]).to have_key("description")
    end
  end

  def query
    <<~GQL
    query {
      allGroups {
        id
        name
        description
      }
    }
    GQL
  end
end
