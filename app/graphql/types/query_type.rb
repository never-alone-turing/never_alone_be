module Types
  class QueryType < Types::BaseObject

    field :all_users, [Types::UserType], null: false, description: 'Returns a list of all existing users'
    field :user, Types::UserType, null: false do
      description 'Return a single user by id'
      argument :id, ID, required: true
    end

    def all_users
      User.all
    end

    def user(id:)
      User.find(id)
    end
  end
end
