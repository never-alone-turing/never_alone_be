require 'rails_helper'
require 'pry'

RSpec.describe "Add Checkin" do

  before :each do
    @user1 = User.create(username: "Herb Gutmann1", email: "user-1000@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
    @group = Group.create(name: "Group1", description: "it is a group")
  end

  it "Create a checkin" do

    mutation_string = <<-GRAPHQL
    mutation{
	    addCheckin(input:{
        response: "Pending",
        category: "Wellness",
        time: "2021-01-04T21:12:19Z",
        window: "2021-01-04T21:12:19Z",
        userId: "#{@user1.id}",
        groupId: "#{@group.id}",
        name: "checkin1"
        }
        ){
          checkin{
            response
            category
            time
            window
            userId
            groupId
            name
          }
        }
      }
      GRAPHQL

      post graphql_path, params: {query: mutation_string}
      result = JSON.parse(response.body)

      expect(result).to have_key("data")
      expect(result["data"]).to have_key("addCheckin")
      expect(result["data"]["addCheckin"].length).to eq(1)
      expect(result).to eq({"data"=>{"addCheckin"=>{"checkin"=>{"response"=>"Pending", "category"=>"Wellness", "time"=>"2021-01-04T21:12:19Z", "window"=>"2021-01-04T21:12:19Z", "userId"=>"#{@user1.id}", "groupId"=>"#{@group.id}", "name"=>"checkin1"}}}})
  end

  it "has a sad path error" do
    mutation_string = <<-GRAPHQL
    mutation{
	    addCheckin(input:{
        response: "Pending",
        category: "Wellness",
        time: "2021-01-04T21:12:19Z",
        window: "2021-01-04T21:12:19Z",
        userId: "#{@user1.id}",
        groupId: "#{@group.id}"
        }
        ){
          checkin{
            response
            category
            time
            window
            userId
            groupId
          }
        }
      }
      GRAPHQL

    post graphql_path, params: {query: mutation_string}
    result = JSON.parse(response.body)
    expect(result).to have_key("errors")
    expect(result["errors"].first["message"]).to eq("Argument 'name' on InputObject 'AddCheckinInput' is required. Expected type String!")
  end
end
