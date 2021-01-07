module Mutations
  class UpdateCheckin < BaseMutation
    argument :id, ID, required: true
    argument :time, String, required: false
    argument :response, String, required: false
    argument :user_id, ID, required: false
    argument :group_id, ID, required: false
    argument :window, String, required: false
    argument :category, String, required: false
    argument :name, String, required: false



    field :checkin, Types::CheckinType, null: true
    field :errors, [String], null: false

    def resolve(id:, **argument)
      checkin = Checkin.find(id)
        if checkin.update!(
          argument
        )
        { checkin: checkin }
      else
        { errors: checkin.errors.full_messages }
      end
    end
  end
end
