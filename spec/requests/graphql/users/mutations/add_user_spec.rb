require 'rails_helper'

RSpec.describe "Add User" do

  it "Create an user" do

    mutation_string = <<-GRAPHQL
      mutation{
        addUser(
          input:{
            username: "Daniel",
            email: "daniel@email",
            avatar: "avatar",
            phone: "phone"
          } 	
        )
        {
          user{
            id
            username
          }
        }
      }
    GRAPHQL

    post graphql_path, params: {query: mutation_string}
    result = JSON.parse(response.body)

    user_id = result['data']['addUser']['user']['id']
    expect(result).to eq({"data"=>{"addUser"=>{"user"=>{"id"=>"#{user_id}", "username"=>"Daniel"}}}})
  end
end