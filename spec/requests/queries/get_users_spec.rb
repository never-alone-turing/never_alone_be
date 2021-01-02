require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'users' do
    it 'can query all existing users' do
      create_list(:user, 4)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)

      expect(result["data"]["allUsers"].count).to eq(4)
    end
  end

  def query
    <<~GQL
    query {
      allUsers {
        id
        username
        email
        phone
        avatar
      }
    }
    GQL
  end
end
