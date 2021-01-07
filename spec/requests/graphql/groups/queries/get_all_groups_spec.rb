require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'groups' do
    it 'can query all existing groups' do
      create_list(:group, 4)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)
    
      expect(result["data"]["allGroups"].count).to eq(4)
    end
  end

  def query
    <<~GQL
    query {
      allGroups {
        id
        name
        description
      }
    }
    GQL
  end
end
