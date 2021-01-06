require 'rails_helper'
require 'pry'

RSpec.describe "Update checkin" do
  before :each do
    @user1 = User.create(username: "Herb Gutmann1", email: "user-1000@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
    @user2 = User.create(username: "Other Gutmann1", email: "asd@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
    @group = Group.create(name: "Group1", description: "it is a group")
    @checkin1 = Checkin.create(category:0, time: DateTime.now, response: true, user_id: @user1.id, group_id: @group.id, window: DateTime.now)
    @checkin2 = Checkin.create(category:1, time: DateTime.now, response: true, user_id: @user1.id, group_id: @group.id, window: DateTime.now)
    @checkin3 = Checkin.create(category:0, time: DateTime.now, response: true, user_id: @user2.id, group_id: @group.id, window: DateTime.now)
  end

  it "Update aa checkin" do
    mutation_string = <<-GRAPHQL
      mutation{
        updateCheckin(
          input:{
            id: "#{@checkin1.id}",
            response: "true",
            category: "medication",
            userId: "#{@user1.id}",
            groupId: "#{@group.id}",
            time: "#{@checkin1.time}",
            window: "#{@checkin1.time}"
          }
        )
        {
          checkin{
            id
            response
            category
            userId
            groupId
            time
            window
          }
        }
      }
    GRAPHQL

    post graphql_path, params: {query: mutation_string}
    result = JSON.parse(response.body)
    binding.pry
    expect(result).to have_key("data")
  end
end
