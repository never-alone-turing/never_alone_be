require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'groups' do
    it 'can query a group by id' do
      group1 = create(:group)
      group2 = create(:group)

      post graphql_path, params: { query: query(id: group1.id) }
      result = JSON.parse(response.body)

      expect(result.count).to eq(1)
      expect(result["data"]["findGroupById"]).to have_key("id")
      expect(result["data"]["findGroupById"]).to have_key("name")
      expect(result["data"]["findGroupById"]).to have_key("description")
    end
  end

  def query(id:)
    <<~GQL
    query {
      findGroupById(id: #{id}) {
        id
        name
        description
      }
    }
    GQL
  end
end
