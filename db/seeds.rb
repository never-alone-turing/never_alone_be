User.destroy_all
Group.destroy_all

FactoryBot.create_list(:user, 25)
FactoryBot.create_list(:group, 4)
