require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'users' do
    it 'Find a user by id' do
      # user = FactoryBot.create(:user)
      user = User.create(username: "Herb Gutmann1", email: "user-100@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")

      query_string = <<-GRAPHQL
        query {
                findUserById(id: $id){
                  username
                }
              }
      GRAPHQL
      user_id = user.id
      result = NeverAloneBeSchema.execute(query_string, variables: { id: user_id })
      ## When I run this and look in pry I get this:
      # #<GraphQL::Query::Result @query=... @to_h={"errors"=>[{"message"=>"Variable $id is used by  but not declared", "locations"=>[{"line"=>2, "column"=>34}], "path"=>["query", "findUserById", "id"], "extensions"=>{"code"=>"variableNotDefined", "variableName"=>"id"}}]}>
      # binding.pry

      user_result = result["data"]["query"]

      expect(data).to include(
        'id'              => be_present,
        'username'           => 'Herb Gutmann1',
        'email' => "user-1@email.com",
        'phone' => "(346) 733-0084",
        'role'           => 'user',
        'avatar'          => "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1"
      )
    end
  end
end
