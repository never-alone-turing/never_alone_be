require 'rails_helper'

RSpec.describe "User Query" do

  it "Find user by id" do
    user = User.create(username: "Herb Gutmann1", email: "user-1000@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
      user_id = user.id

      query_string = <<-GRAPHQL
        query {
                findUserById(id: "#{user_id}"){
                  id
                  username
                }
              }
      GRAPHQL

    post graphql_path, params: {query: query_string}
    result = JSON.parse(response.body)

    expect(result).to eq({"data"=>{"findUserById"=>{"id"=>"#{user_id}", "username"=>"Herb Gutmann1"}}})
  end
end
