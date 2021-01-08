require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'groups' do
    it 'can update a group' do
      group = create(:group)

      post graphql_path, params: { query: query1(group.id) }
      result = JSON.parse(response.body)

      expect(result["data"]).to have_key("updateGroup")
      expect(result["data"]["updateGroup"]).to have_key("group")
      expect(result["data"]["updateGroup"]["group"]).to have_key("id")
      expect(result["data"]["updateGroup"]["group"]).to have_key("name")
      expect(result["data"]["updateGroup"]["group"]["name"]).to eq("Best Group")
      expect(result["data"]["updateGroup"]["group"]).to have_key("description")
      expect(result["data"]["updateGroup"]["group"]["description"]).to eq("We're watching you. All the time")
    end
  end

  def query1(id)
    <<~GQL
    mutation {
      updateGroup(
        input: {
          id: #{id},
          name: "Best Group",
          description: "We're watching you. All the time"
        }
      )
      {
        group {
          id
          name
          description
        }
      }
    }
    GQL
  end

    it 'throws an error if a field is missing' do
      group = create(:group)

      post graphql_path, params: { query: query2(group.id) }
      result = JSON.parse(response.body)

      expect(result).to have_key("errors")
      expect(result["errors"][0]).to have_key("message")
      expect(result["errors"][0]["message"]).to eq( "Argument 'name' on InputObject 'UpdateGroupInput' is required. Expected type String!")
    end

  def query2(id)
    <<~GQL
    mutation {
      updateGroup(
        input: {
          id: #{id},
          description: "We're watching you. All the time"
        }
      )
      {
        group {
          id
          description
        }
      }
    }
    GQL
  end
  end
