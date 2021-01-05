module Mutations
  class UpdateUser < BaseMutation
    argument :id, ID, required: true
    argument :username, String, required: false
    argument :email, String, required: false
    argument :avatar, String, required: false
    argument :phone, String, required: false
    argument :role, String, required: false

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(id:, **argument)
      user = User.find(id)
      if user.update!(
        argument
        )
        { user: user }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end