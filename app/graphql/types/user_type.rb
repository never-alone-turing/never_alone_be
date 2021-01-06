module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :avatar, String, null: true
    field :phone, String, null: true

    field :checkin, [Types::CheckinType], null: false
    field :group_users, [Types::GroupUserType], null: true
    field :groups, [Types::GroupType], null: true
    field :role, Enums::Role, null: false
  end
end
