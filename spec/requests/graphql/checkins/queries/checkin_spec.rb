require 'rails_helper'
require 'pry'

RSpec.describe "Checkin Query" do
  before :each do
    @user1 = User.create(username: "Herb Gutmann1", email: "user-1000@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
    @user2 = User.create(username: "Other Gutmann1", email: "asd@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
    @group = Group.create(name: "Group1", description: "it is a group")
    @checkin1 = Checkin.create(category:0, time: DateTime.now, response: 0, user_id: @user1.id, group_id: @group.id, window: DateTime.now, name: "checkin1")
    @checkin2 = Checkin.create(category:1, time: DateTime.now, response: 1, user_id: @user1.id, group_id: @group.id, window: DateTime.now, name: "checkin2")
    @checkin3 = Checkin.create(category:0, time: DateTime.now, response: 2, user_id: @user2.id, group_id: @group.id, window: DateTime.now, name: "checkin3")
  end

  it "Find all checkins" do
    query_string = <<-GRAPHQL
      query {
              allCheckins{
                id
                response
                category
                userId
                time
                window
                groupId
                name
              }
            }
    GRAPHQL

    post graphql_path, params: {query: query_string}
    result = JSON.parse(response.body)

    expect(result).to have_key("data")
    expect(result["data"]).to have_key("allCheckins")
    expect(result["data"]["allCheckins"].length).to eq(3)
    expect(result["data"]["allCheckins"][0]).to have_key("id")
    expect(result["data"]["allCheckins"][0]).to have_key("response")
    expect(result["data"]["allCheckins"][0]).to have_key("category")
    expect(result["data"]["allCheckins"][0]).to have_key("userId")
    expect(result["data"]["allCheckins"][0]).to have_key("groupId")
    expect(result["data"]["allCheckins"][0]).to have_key("time")
    expect(result["data"]["allCheckins"][0]).to have_key("window")
    expect(result["data"]["allCheckins"][0]).to have_key("name")
  end

  it "Find all checkins for a single user" do
    query_string = <<-GRAPHQL
      query {
              checkinsForUser(userId: "#{@user1.id}"){
                id
                response
                category
                userId
                time
                window
                groupId
              }
            }
    GRAPHQL

    post graphql_path, params: {query: query_string}
    result = JSON.parse(response.body)

    expect(result).to have_key("data")
    expect(result["data"]).to have_key("checkinsForUser")
    expect(result["data"]["checkinsForUser"].length).to eq(2)
    expect(result["data"]["checkinsForUser"][0]).to have_key("id")
    expect(result["data"]["checkinsForUser"][0]).to have_key("response")
    expect(result["data"]["checkinsForUser"][0]).to have_key("category")
    expect(result["data"]["checkinsForUser"][0]).to have_key("userId")
    expect(result["data"]["checkinsForUser"][0]).to have_key("groupId")
    expect(result["data"]["checkinsForUser"][0]).to have_key("time")
    expect(result["data"]["checkinsForUser"][0]).to have_key("window")
  end

  it "has a sad path error" do
    query_string = <<-GRAPHQL
      query {
              allCheckins{
                id
                response
                category
                user_id
                time
                window
                groupId
              }
            }
    GRAPHQL

    post graphql_path, params: {query: query_string}
    result = JSON.parse(response.body)
    expect(result).to have_key("errors")
    expect(result["errors"].first["message"]).to eq("Field 'user_id' doesn't exist on type 'Checkin'")
  end
end
