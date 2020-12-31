module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :avatar, String, null: true
    field :phone, String, null: true

    field :role, Enums::Role, null: false 
  end
end
