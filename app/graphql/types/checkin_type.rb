module Types
  class CheckinType < Types::BaseObject
    field :id, ID, null: false
    field :time, GraphQL::Types::ISO8601DateTime, null: false
    field :response, Boolean, null: true
    field :window, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, ID, null: false
    # field :group_id, ID, null: false

    field :category, Enums::Category, null: false

  end
end
