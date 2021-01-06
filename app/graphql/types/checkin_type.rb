module Types
  class CheckinType < Types::BaseObject
    field :id, ID, null: false
    field :time, GraphQL::Types::ISO8601DateTime, null: false
    field :window, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, ID, null: false
    field :group_id, ID, null: false

    field :category, Enums::Category, null: false
    field :response, Enums::Response, null: false
  end
end
