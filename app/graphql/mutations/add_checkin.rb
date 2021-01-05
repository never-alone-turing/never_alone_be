module Mutations
  class AddCheckin < BaseMutation

    argument :time, String, required: true
    argument :response, String, required: true
    argument :user_id, String, required: false
    argument :group_id, String, required: false
    argument :window, String, required: false


    field :checkin, Types::CheckinType, null: true
    field :errors, [String], null: false

    def resolve(time: nil, response: nil, user_id: nil, group_id: nil, window: nil)
      checkin = Checkin.create!(
        time: time,
        response: response,
        user_id: user_id,
        group_id: group_id,
        window: window
      )

      if checkin.save
        { checkin: checkin }
      else
        { errors: checkin.errors.full_messages }
      end
    end
  end
end