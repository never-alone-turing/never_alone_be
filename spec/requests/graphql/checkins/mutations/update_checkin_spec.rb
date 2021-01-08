require 'rails_helper'
require 'pry'

RSpec.describe "Update checkin" do
  before :each do
    @user1 = User.create(username: "Herb Gutmann1", email: "user-1000@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
    @user2 = User.create(username: "Other Gutmann1", email: "asd@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
    @group = Group.create(name: "Group1", description: "it is a group")
    @checkin1 = Checkin.create(category:0, time: DateTime.now, response: 0, user_id: @user1.id, group_id: @group.id, window: DateTime.now, name: "checkin1")
    @checkin2 = Checkin.create(category:1, time: DateTime.now, response: 1, user_id: @user1.id, group_id: @group.id, window: DateTime.now, name: "checkin2")
    @checkin3 = Checkin.create(category:0, time: DateTime.now, response: 2, user_id: @user2.id, group_id: @group.id, window: DateTime.now, name: "checkin3")
  end

  it "Update a checkin" do
    mutation_string = <<-GRAPHQL
      mutation{
        updateCheckin(
          input:{
            id: "#{@checkin1.id}",
            response: "Answered",
            category: "Medication",
            userId: "#{@user1.id}",
            groupId: "#{@group.id}",
          }
        )
        {
          checkin{
            id
            response
            category
            userId
            groupId
          }
        }
      }
    GRAPHQL

    post graphql_path, params: {query: mutation_string}
    result = JSON.parse(response.body)

    expect(result).to have_key("data")
    expect(result).to eq({"data"=>{"updateCheckin"=>{"checkin"=>{"category"=>"Medication", "groupId"=>"#{@group.id}", "id"=>"#{@checkin1.id}", "response"=>"Answered", "userId"=>"#{@user1.id}"}}}})
  end

  it "has a sad path error" do
    mutation_string = <<-GRAPHQL
      mutation{
        updateCheckin(
          input:{
          }
        )
        {
          checkin{
            id
            response
            category
            userId
            groupId
          }
        }
      }
    GRAPHQL

    post graphql_path, params: {query: mutation_string}
    result = JSON.parse(response.body)

    expect(result).to have_key("errors")
    expect(result["errors"].first["message"]).to eq("Argument 'id' on InputObject 'UpdateCheckinInput' is required. Expected type ID!")
  end
end
