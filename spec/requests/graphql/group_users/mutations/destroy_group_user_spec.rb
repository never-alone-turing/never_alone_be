require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'group users' do
    it 'can destroy a group user' do
      group_user = create(:group_user)

      post graphql_path, params: { query: query1(group_user.id) }
      result = JSON.parse(response.body)

      expect(GroupUser.count).to eq(0)
    end
  end

  def query1(id)
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

  it 'throws an error if id is missing' do
    group_user = create(:group_user)

    post graphql_path, params: { query: query2(group_user.id) }
    result = JSON.parse(response.body)

    expect(result).to have_key("errors")
    expect(result["errors"][0]).to have_key("message")
    expect(result["errors"][0]["message"]).to eq( "Argument 'id' on InputObject 'DestroyGroupUserInput' is required. Expected type ID!")
  end

  def query2(id)
    <<~GQL
    mutation {
      destroyGroupUser(
        input: {

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
