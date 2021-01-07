module Mutations
    class DestroyCheckin < BaseMutation
      argument :id, ID, required: true

    field :checkin, Types::CheckinType, null: true

      def resolve(id:)
        checkin = Checkin.find(id).destroy
        { checkin: checkin }
      end
    end
end
