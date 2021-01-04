require 'rails_helper'

describe Checkin, type: :model do
  describe "validations" do
    it { should validate_presence_of :checkin_type }
    it { should validate_presence_of :time }
    it { should validate_presence_of :response }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :group_id }
    it { should validate_presence_of :window }

  end

  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :group}
  end

  describe "checkin_types" do
    it "can be created with a type of 'wellness' " do
      checkin_1 = Checkin.new({checkin_type: 0, time: DateTime.now})
      expect(checkin_1.checkin_type).to eq("wellness")
    end

    it "can be created with a type of 'medication' " do
      checkin_1 = Checkin.new({checkin_type: 1, time: DateTime.now})
      expect(checkin_1.checkin_type).to eq("medication")
    end
  end

  describe "response" do
    it "defaults to a response of 'nil' " do
      checkin_1 = Checkin.new({checkin_type: 0, time: DateTime.now})
      expect(checkin_1.response).to eq(nil)
    end

    it "can have a response of 'true' " do
      checkin_1 = Checkin.new({checkin_type: 0, time: DateTime.now, response: true})
      expect(checkin_1.response).to eq(true)
    end

    it "can have a response of 'false' " do
      checkin_1 = Checkin.new({checkin_type: 0, time: DateTime.now, response: false})
      expect(checkin_1.response).to eq(false)
    end
  end
end
