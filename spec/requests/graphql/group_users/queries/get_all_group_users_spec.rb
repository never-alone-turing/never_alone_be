require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'group_users' do
    it 'can query all existing group_users' do
      create_list(:group_user, 4)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)

      expect(GroupUser.count).to eq(4)
    end
  end

  def query
    <<~GQL
    query {
      allGroupUsers {
        id
        group_id
        user_id
      }
    }
    GQL
  end
end
