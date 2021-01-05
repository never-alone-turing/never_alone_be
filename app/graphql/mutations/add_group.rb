module Mutations
  class AddGroup < BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true

    field :group, Types::GroupType, null: true
    field :errors, [String], null: false

    def resolve(name: nil, description: nil)
      group = Group.create!(
        name: name,
        description: description
      )

      if group.save
        { group: group }
      else
        { errors: group.errors.full_messages }
      end
    end
  end
end
