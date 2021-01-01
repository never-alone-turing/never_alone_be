module Mutations
    class DestroyUser < BaseMutation
      argument :id, ID, required: true

    field :user, Types::UserType, null: true

      def resolve(id:)
        user = User.find(id).destroy
        { user: user }
      end
    end
end