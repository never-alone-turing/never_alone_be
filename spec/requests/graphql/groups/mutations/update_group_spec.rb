require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'groups' do
    it 'can update a group' do
      group = create(:group)

      post graphql_path, params: { query: query(group.id) }
      result = JSON.parse(response.body)

      expect(result["data"]).to have_key("updateGroup")
      expect(result["data"]["updateGroup"]).to have_key("group")
      expect(result["data"]["updateGroup"]["group"]).to have_key("id")
      expect(result["data"]["updateGroup"]["group"]).to have_key("name")
      expect(result["data"]["updateGroup"]["group"]["name"]).to eq("Best Group")
      expect(result["data"]["updateGroup"]["group"]).to have_key("description")
      expect(result["data"]["updateGroup"]["group"]["description"]).to eq("We're watching you. All the time")
    end
  end

  def query(id)
    <<~GQL
    mutation {
      updateGroup(
        input: {
          id: #{id},
          name: "Best Group",
          description: "We're watching you. All the time"
        }
      )
      {
        group {
          id
          name
          description
        }
      }
    }
    GQL
  end
end
