User.destroy_all
Checkin.destroy_all


FactoryBot.create_list(:user, 25)
# FactoryBot.create_list(:checkin, 25)
@user1 = User.create(username: "Herb Gutmann1", email: "user-1000@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
@user2 = User.create(username: "Other Gutmann1", email: "asd@email.com", phone: "(346) 733-0084", role: 'user', avatar: "https://robohash.org/atquenisimolestias.png?size=300x300&set=set1")
@group = Group.create(name: "Group1", description: "it is a group")
@checkin1 = Checkin.create(category:0, time: DateTime.now, response: 0, user_id: @user1.id, group_id: @group.id, window: DateTime.now)
@checkin2 = Checkin.create(category:1, time: DateTime.now, response: 1, user_id: @user1.id, group_id: @group.id, window: DateTime.now)
@checkin3 = Checkin.create(category:0, time: DateTime.now, response: 2, user_id: @user2.id, group_id: @group.id, window: DateTime.now)
Group.destroy_all

FactoryBot.create_list(:user, 25)
FactoryBot.create_list(:group, 4)
