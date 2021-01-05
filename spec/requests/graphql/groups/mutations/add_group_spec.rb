require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'groups' do
    it 'can create a new group' do

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)

      expect(result["data"]).to have_key("addGroup")
      expect(result["data"]["addGroup"]).to have_key("group")
      expect(result["data"]["addGroup"]["group"]).to have_key("name")
      expect(result["data"]["addGroup"]["group"]["name"]).to eq("Best Group")
      expect(result["data"]["addGroup"]["group"]).to have_key("description")
      expect(result["data"]["addGroup"]["group"]["description"]).to eq("We're watching you")
    end
  end

  def query
    <<~GQL
    mutation {
      addGroup(
        input: {
          name: "Best Group",
          description: "We're watching you"
        }
      )
      {
        group {
          name
          description
        }
      }
    }
    GQL
  end
end
