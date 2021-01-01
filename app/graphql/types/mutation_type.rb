module Types
  class MutationType < Types::BaseObject
    field :add_user, mutation: Mutations::AddUser,
      description: "Add a new user"
  end
end
