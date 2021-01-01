require 'rails_helper'

RSpec.describe "Update User" do

  it "Update an user" do
    user = User.create(id: '100', username: "Daniel", email: "daniel@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")

    mutation_string = <<-GRAPHQL
      mutation{
        updateUser(
          input:{
            id: "100",
            username: "Daniel Lessenden",
            email: "daniel_lessenden@email",
            avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1"
            phone: "(346) 733-0084", 
            role: "user", 
          } 	
        )
        {
          user{
            id
            username
            email
          }
        }
      }
    GRAPHQL

    post graphql_path, params: {query: mutation_string}
    result = JSON.parse(response.body)

    expect(result).to eq({"data"=>{"updateUser"=>{"user"=>{"id"=>"100", "username"=>"Daniel Lessenden", "email"=>"daniel_lessenden@email"}}}})
  end
end