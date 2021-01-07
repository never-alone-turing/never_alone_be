require 'rails_helper'

RSpec.describe "Users Query" do

  it "Get a list of all existing users" do
    user_1 = User.create(username: "Frankie Buckridge1", email: "user-1@email.com", phone: "799-685-6247 x72080", role: 'user', avatar: "https://robohash.org/veritatisetvitae.png?size=300x300&set=set1")
    user_2 = User.create(username: "Jonathon Boehm2", email: "user-2@email.com", phone: "(346) 733-0084", role: 'caretaker', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
    user_3 = User.create(username: "Brianne McGlynn Ret.3", email: "user-3@email.com", phone: "(346) 733-0000", role: 'receiver', avatar: "https://robohash.org/ipsamomnisenim.png?size=300x300&set=set1")

    user_1_id = user_1.id
    user_2_id = user_2.id
    user_3_id = user_3.id

    query_string = <<-GRAPHQL
      query {
              allUsers{
                id
                username
                role
              }
            }
    GRAPHQL

    post graphql_path, params: {query: query_string}
    result = JSON.parse(response.body)

    expect(result).to be_a(Hash)
    expect(result['data']).to be_a(Hash)
    expect(result['data']['allUsers']).to be_an(Array)
    expect(result['data']['allUsers'].first(3)).to eq([
    {"id"=>"283", "role"=>"user", "username"=>"Frankie Buckridge1"},
    {"id"=>"284", "role"=>"caretaker", "username"=>"Jonathon Boehm2"},
    {"id"=>"285", "role"=>"receiver", "username"=>"Brianne McGlynn Ret.3"}])
  end
end
