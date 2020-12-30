module Types
  class QueryType < Types::BaseObject
    field :all_users,
    [Types::UserType],
    null: false,
    description: "Returns a list of existing users"

    field :user, Types::UserType, null: false do
      description 'Find a user by ID'
      argument :id, ID, required: true
    end

    #---- Resolvers
    def all_users
      User.all
    end

    def user(id:)
      User.find(id)
    end
  end
end
