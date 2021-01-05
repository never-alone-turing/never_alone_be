module Types
  class MutationType < Types::BaseObject
    field :add_user, mutation: Mutations::AddUser, description: "Add a new user"
    field :update_user, mutation: Mutations::UpdateUser, description: "Update an existing user"
    field :destroy_user, mutation: Mutations::DestroyUser, description: "Destroy an existing user"

    field :add_checkin, mutation: Mutations::AddCheckin, description: "Add a new checkin for a user"
    field :update_checkin, mutation: Mutations::UpdateCheckin, description: "Update an existing checkin"
    field :destroy_checkin, mutation: Mutations::DestroyCheckin, description: "Destroy an existing checkin"
  end
end
