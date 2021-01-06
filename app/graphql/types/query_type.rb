module Types
  class QueryType < Types::BaseObject
    field :all_users, [Types::UserType], null: false,
    description: "Returns a list of existing users"
    field :find_user_by_id, Types::UserType, null: false do
      description 'Find a user by ID'
      argument :id, ID, required: true
    end

    field :all_groups, [Types::GroupType], null: false do
      description 'Find all existing groups'
    end
    field :find_group_by_id, Types::GroupType, null: false do
      description 'Find a group by id'
      argument :id, ID, required: true
    end

    field :checkins_for_user, [Types::CheckinType], null: false do
      description 'Find all checkins for user'
      argument :user_id, ID, required: true
    end
    field :all_checkins, [Types::CheckinType], null: false,
    description: "Returns a list of existing checkins"

    field :all_group_users, [Types::GroupUserType], null: false do
      description 'Find all existing group_users'
    end

    #---- Resolvers
    def all_users
      User.all
    end

    def find_user_by_id(id:)
      User.find(id)
    end

    def all_groups
      Group.all
    end

    def find_group_by_id(id:)
      Group.find(id)

    def all_checkins
      Checkin.all
    end

    def checkins_for_user(user_id:)
      User.find(user_id).checkins
    end

    def all_group_users
      GroupUser.all
    end 
  end
end
end
