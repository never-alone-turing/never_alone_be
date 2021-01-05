module Mutations
  class UpdateCheckin < BaseMutation
    argument :id, ID, required: true
    argument :checkin_type, String, required: true
    argument :time, String, required: true
    argument :response, String, required: false
    argument :user_id, ID, required: true
    argument :group_id, ID, required: true
    argument :window, String, required: true


    field :checkin, Types::CheckinType, null: true
    field :errors, [String], null: false

    def resolve(time: nil, response: nil, user_id: nil, group_id: nil, window: nil)
      checkin = Checkin.find(id)
        if checkin.update!(
        checkin_type: checkin_type,
        time: time,
        response: response,
        user_id: user_id,
        group_id: group_id,
        window: window
        )
        { checkin: checkin }
      else
        { errors: checkin.errors.full_messages }
      end
    end
  end
end
