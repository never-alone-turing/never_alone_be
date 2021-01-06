require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'group_users' do
    it 'can query a group_user by id' do
      group_user_1 = create(:group_user)
      group_user_2 = create(:group_user)

      post graphql_path, params: { query: query(id: group_user_1.id) }
      result = JSON.parse(response.body)
      expect(result.count).to eq(1)

      expect(result["data"]["findGroupUserById"]).to have_key("id")
    end
  end

  def query(id:)
    <<~GQL
    query {
      findGroupUserById(id: #{id}) {
        id
      }
    }
    GQL
  end
end
