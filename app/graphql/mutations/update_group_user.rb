module Mutations
  class UpdateGroupUser < BaseMutation
    argument :id, ID, required: true
    argument :user_id, String, required: true
    argument :group_id, String, required: true

    field :group_user, Types::GroupUserType, null: true
    field :errors, [String], null: false

    def resolve(id:, **argument)
      group_user = GroupUser.find(id)
      if group_user.update!(
        argument
      )
        { group_user: group_user }
      else
        { errors: group_user.errors.full_messages }
      end
    end
  end
end
