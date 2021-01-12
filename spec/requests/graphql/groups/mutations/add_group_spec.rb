require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'groups' do
    it 'can create a new group' do

      post graphql_path, params: { query: query1 }
      result = JSON.parse(response.body)

      expect(result["data"]).to have_key("addGroup")
      expect(result["data"]["addGroup"]).to have_key("group")
      expect(result["data"]["addGroup"]["group"]).to have_key("name")
      expect(result["data"]["addGroup"]["group"]["name"]).to eq("Best Group")
      expect(result["data"]["addGroup"]["group"]).to have_key("description")
      expect(result["data"]["addGroup"]["group"]["description"]).to eq("We're watching you")
    end
  end

  def query1
    <<~GQL
    mutation {
      addGroup(
        input: {
          name: "Best Group",
          description: "We're watching you"
        }
      )
      {
        group {
          name
          description
        }
      }
    }
    GQL
  end

  it 'throws an error if a field is missing' do

    post graphql_path, params: { query: query2 }
    result = JSON.parse(response.body)

    expect(result).to have_key("errors")
    expect(result["errors"][0]).to have_key("message")
    expect(result["errors"][0]["message"]).to eq("Argument 'name' on InputObject 'AddGroupInput' is required. Expected type String!")
  end

  def query2
    <<~GQL
    mutation {
      addGroup(
        input: {
          description: "We're watching you"
        }
      )
      {
        group {
          description
        }
      }
    }
    GQL
  end
end
