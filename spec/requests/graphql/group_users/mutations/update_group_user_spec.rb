require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'group users' do
    it 'can update a group_user' do
      @user1 = create(:user)
      @user2 = create(:user)
      @group1 = create(:group)
      @gu1 = create(:group_user, user_id: @user1.id)
      @gu2 = create(:group_user, user_id: @user2.id)

      post graphql_path, params: { query: query(@gu1.id) }
      result = JSON.parse(response.body)

      expect(result["data"]).to have_key("updateGroupUser")
      expect(result["data"]["updateGroupUser"]).to have_key("groupUser")
      expect(result["data"]["updateGroupUser"]["groupUser"]).to have_key("userId")
      expect(result["data"]["updateGroupUser"]["groupUser"]["userId"]).to eq(@user2.id.to_s)
      expect(result["data"]["updateGroupUser"]["groupUser"]).to have_key("groupId")
    end
  end

  def query(id)
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
end
