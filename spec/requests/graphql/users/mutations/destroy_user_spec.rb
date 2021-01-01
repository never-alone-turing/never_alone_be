require 'rails_helper'

RSpec.describe "Destory User" do

  it "Destroy an user" do
    user = User.create(id: '100', username: "Daniel", email: "daniel@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")

    mutation_string = <<-GRAPHQL
      mutation{
        destroyUser(
          input:{
            id: "100"
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

    expect(result).to eq({"data"=>{"destroyUser"=>{"user"=>{"id"=>"100", "username"=>"Daniel"}}}})
  end
end