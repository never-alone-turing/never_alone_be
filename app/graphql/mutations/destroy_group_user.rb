module Mutations
  class DestroyGroupUser < BaseMutation
    argument :id, ID, required: true

    field :group_user, Types::GroupUserType, null: true

    def resolve(id:)
      group_user = GroupUser.find(id).destroy
      { group_user: group_user }
    end
  end
end
