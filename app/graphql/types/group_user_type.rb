module Types
  class GroupUserType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :group_id, ID, null: false
  end
end
