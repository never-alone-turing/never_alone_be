module Types
  class GroupType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :group_users, [Types::GroupUserType], null: false
    field :users, [Types::UserType], null: false
    #field :checkins, [Types::CheckinType], null: false
  end
end
