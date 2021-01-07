require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'group users' do
    it 'can destroy a group user' do
      group_user = create(:group_user)

      post graphql_path, params: { query: query(group_user.id) }
      result = JSON.parse(response.body)

      expect(GroupUser.count).to eq(0)
    end
  end

  def query(id)
    <<~GQL
    mutation {
      destroyGroupUser(
        input: {
          id: #{id}
        }
      )
      {
        groupUser {
          id
          userId
          groupId
        }
      }
    }
    GQL
  end
end
