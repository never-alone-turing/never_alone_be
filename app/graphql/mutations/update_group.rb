module Mutations
  class UpdateGroup < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :description, String, required: true

    field :group, Types::GroupType, null: true
    field :errors, [String], null: false

    def resolve(id:, **argument)
      group = Group.find(id)
      if group.update!(
        argument
      )
        { group: group }
      else
        { errors: group.errors.full_messages }
      end
    end
  end
end
