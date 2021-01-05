User.destroy_all
Checkin.destroy_all


FactoryBot.create_list(:user, 25)
FactoryBot.create_list(:checkin, 25)
