module Types
  class QueryType < Types::BaseObject
    field :all_users,
    [Types::UserType],
    null: false,
    description: "Returns a list of existing users"

    field :find_user_by_id, Types::UserType, null: false do
      description 'Find a user by ID'
      argument :id, ID, required: true
    end

    field :checkins_for_user, [Types::CheckinType], null: false do
      description 'Find all checkins for user'
      argument :user_id, ID, required: true
    end

    field :all_checkins,
    [Types::CheckinType],
    null: false,
    description: "Returns a list of existing checkins"

    #---- Resolvers
    def all_users
      User.all
    end

    def find_user_by_id(id:)
      User.find(id)
    end

    def all_checkins
      Checkin.all
    end

    def checkins_for_user(user_id:)
      User.find(user_id).checkins
    end
  end
end
