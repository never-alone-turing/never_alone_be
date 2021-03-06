module Types
  class MutationType < Types::BaseObject
    field :add_user, mutation: Mutations::AddUser, description: "Add a new user"
    field :update_user, mutation: Mutations::UpdateUser, description: "Update an existing user"
    field :destroy_user, mutation: Mutations::DestroyUser, description: "Destroy an existing user"
    field :add_group, mutation: Mutations::AddGroup, description: "Add a new group"
    field :update_group, mutation: Mutations::UpdateGroup, description: "Update an existing group"
    field :destroy_group, mutation: Mutations::DestroyGroup, description: "Destroy an existing group"
    field :add_checkin, mutation: Mutations::AddCheckin, description: "Add a new checkin for a user"
    field :update_checkin, mutation: Mutations::UpdateCheckin, description: "Update an existing checkin"
    field :destroy_checkin, mutation: Mutations::DestroyCheckin, description: "Destroy an existing checkin"
    field :add_group_user, mutation: Mutations::AddGroupUser, description: "Add a new group user"
    field :update_group_user, mutation: Mutations::UpdateGroupUser, description: "Update an existing group_user"
    field :destroy_group_user, mutation: Mutations::DestroyGroupUser, description: "Destroy an existing group user"
  end
end
