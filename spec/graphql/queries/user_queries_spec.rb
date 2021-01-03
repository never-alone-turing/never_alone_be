require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'users' do
    it 'Find a user by id' do
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

      result = NeverAloneBeSchema.execute(query_string, variables: { id: user_id })

      user_result = result["data"]["findUserById"]

      expect(user_result['id']).to eq("#{user_id}")
      expect(user_result['username']).to eq('Herb Gutmann1')
    end
  end
end
