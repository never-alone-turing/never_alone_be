module Mutations
  class UpdateUser < BaseMutation
    argument :id, ID, required: true
    argument :username, String, required: true
    argument :email, String, required: true
    argument :avatar, String, required: false
    argument :phone, String, required: false
    argument :role, String, required: false

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(id:, username: nil, email: nil, avatar: nil, phone: nil, role: nil)
      user = User.find(id)
      if user.update!(
        username: username,
        email: email,
        avatar: avatar,
        phone: phone,
        role: role
        )
        { user: user }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end