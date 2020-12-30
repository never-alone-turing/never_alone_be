module Types
  class QueryType < Types::BaseObject
    field :all_users,
    [Types::UserType],
    null: false,
    description: "Returns a list of existing users"

    #---- Resolvers
    def all_users
      User.all
    end
  end
end
