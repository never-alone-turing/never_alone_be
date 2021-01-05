require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'groups' do
    it 'can destroy a group' do
      group = create(:group)

      post graphql_path, params: { query: query(group.id) }
      result = JSON.parse(response.body)

      expect(Group.count).to eq(0)
    end
  end

  def query(id)
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
end
