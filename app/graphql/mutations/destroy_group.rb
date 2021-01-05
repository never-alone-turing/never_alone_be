module Mutations
  class DestroyGroup < BaseMutation
    argument :id, ID, required: true

    field :group, Types::GroupType, null: true

    def resolve(id:)
      group = Group.find(id).destroy
      { group: group }
    end
  end
end
