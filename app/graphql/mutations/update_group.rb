module Mutations
  class UpdateGroup < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :description, String, required: true

    field :group, Types::GroupType, null: true
    field :errors, [String], null: false

    def resolve(id:, name: nil, description: nil)
      group = Group.find(id)
      if group.update!(
        name: name,
        description: description
        )
        { group: group }
      else
        { errors: group.errors.full_messages }
      end
    end
  end
end
