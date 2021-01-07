module Mutations
  class AddGroupUser < BaseMutation
    argument :user_id, String, required: false
    argument :group_id, String, required: false

    field :group_user, Types::GroupUserType, null: true
    field :errors, [String], null: false

    def resolve(user_id: nil, group_id: nil)
      group_user = GroupUser.create!(
        user_id: user_id,
        group_id: group_id
      )

      if group_user.save
        { group_user: group_user }
      else
        { errors: group_user.errors.full_messages }
      end
    end
  end
end
