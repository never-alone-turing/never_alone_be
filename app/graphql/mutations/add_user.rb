module Mutations
  class AddUser < BaseMutation

    argument :username, String, required: true
    argument :email, String, required: true
    argument :avatar, String, required: false
    argument :phone, String, required: false

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(username: nil, email: nil, avatar: nil, phone: nil)
      user = User.create!(
        username: username,
        email: email,
        avatar: avatar,
        phone: phone
      )

      if user.save
        { user: user }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end