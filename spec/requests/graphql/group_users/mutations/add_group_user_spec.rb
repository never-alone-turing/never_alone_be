require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'group_users' do
    it 'can create a new group user' do
      @user1 = create(:user)
      @user2 = create(:user)
      @group1 = create(:group)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)

      expect(result["data"]["addGroupUser"]["groupUser"]["userId"]).to eq(@user1.id.to_s)
      expect(result["data"]["addGroupUser"]["groupUser"]["groupId"]).to eq(@group1.id.to_s)
    end
  end

  def query
    <<~GQL
    mutation {
      addGroupUser(
        input: {
          userId: "#{@user1.id}"
          groupId: "#{@group1.id}"
        }
      )
      {
        groupUser {
          userId
          groupId
        }
      }
    }
    GQL
  end

  it 'throws an error if a field is missing' do
    @user1 = create(:user)
    @user2 = create(:user)
    @group1 = create(:group)

    post graphql_path, params: { query: query2 }
    result = JSON.parse(response.body)

    expect(result).to have_key("errors")
  end

  def query2
    <<~GQL
    mutation {
      addGroupUser(
        input: {
          userId:
          groupId:
        }
      )
      {
        groupUser {
          userId
          groupId
        }
      }
    }
    GQL
  end
end
