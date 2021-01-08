require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'group users' do
    it 'can update a group_user' do
      @user1 = create(:user)
      @user2 = create(:user)
      @group1 = create(:group)
      @gu1 = create(:group_user, user_id: @user1.id)
      @gu2 = create(:group_user, user_id: @user2.id)

      post graphql_path, params: { query: query1(@gu1.id) }
      result = JSON.parse(response.body)

      expect(result["data"]).to have_key("updateGroupUser")
      expect(result["data"]["updateGroupUser"]).to have_key("groupUser")
      expect(result["data"]["updateGroupUser"]["groupUser"]).to have_key("userId")
      expect(result["data"]["updateGroupUser"]["groupUser"]["userId"]).to eq(@user2.id.to_s)
      expect(result["data"]["updateGroupUser"]["groupUser"]).to have_key("groupId")
    end
  end

  def query1(id)
    <<~GQL
    mutation {
      updateGroupUser(
        input: {
          id: "#{@gu1.id}"
          userId: "#{@user2.id}",
          groupId: "#{@group1.id}"
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

  it 'throws an error if a field is missing' do
    @user3 = create(:user)
    @user4 = create(:user)
    @group2 = create(:group)
    @gu3 = create(:group_user, user_id: @user3.id)
    @gu4 = create(:group_user, user_id: @user4.id)

    post graphql_path, params: { query: query2(@gu4.id) }
    result = JSON.parse(response.body)

    expect(result["errors"][0]).to have_key("message")
    expect(result["errors"][0]["message"]).to eq("Argument 'id' on InputObject 'UpdateGroupUserInput' is required. Expected type ID!")
  end

  def query2(id)
    <<~GQL
    mutation {
      updateGroupUser(
        input: {
          userId: "#{@user4.id}",
          groupId: "#{@group2.id}"
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
