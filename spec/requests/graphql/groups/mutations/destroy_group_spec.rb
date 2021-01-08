require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'groups' do
    it 'can destroy a group' do
      group = create(:group)

      post graphql_path, params: { query: query1(group.id) }
      result = JSON.parse(response.body)

      expect(Group.count).to eq(0)
    end
  end

  def query1(id)
    <<~GQL
    mutation {
      destroyGroup(
        input: {
          id: #{id}
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

  it 'throws an error if id is missing' do
    group = create(:group)

    post graphql_path, params: { query: query2(group.id) }
    result = JSON.parse(response.body)

    expect(result).to have_key("errors")
    expect(result["errors"][0]).to have_key("message")
    expect(result["errors"][0]["message"]).to eq("Argument 'id' on InputObject 'DestroyGroupInput' is required. Expected type ID!")
  end

  def query2(id)
    <<~GQL
    mutation {
      destroyGroup(
        input: {

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
end
