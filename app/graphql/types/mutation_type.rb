module Types
  class MutationType < Types::BaseObject
    field :add_user, mutation: Mutations::AddUser, description: "Add a new user"
    field :update_user, mutation: Mutations::UpdateUser, description: "Update an existing user"
    field :destroy_user, mutation: Mutations::DestroyUser, description: "Destroy an existing user"
  end
end
