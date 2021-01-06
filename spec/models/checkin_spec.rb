require 'rails_helper'

describe Checkin, type: :model do
  describe "validations" do
    it { should validate_presence_of :category }
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
      checkin_1 = Checkin.new({category: 0, time: DateTime.now})
      expect(checkin_1.category).to eq("Wellness")
    end

    it "can be created with a type of 'medication' " do
      checkin_1 = Checkin.new({category: 1, time: DateTime.now})
      expect(checkin_1.category).to eq("Medication")
    end
  end

  describe "response" do
    it "defaults to a response of 'Pending' " do
      checkin_1 = Checkin.new({category: 0, time: DateTime.now})
      expect(checkin_1.response).to eq('Pending')
    end

    it "can have a response of 'Answered' " do
      checkin_1 = Checkin.new({category: 0, time: DateTime.now, response: 1})
      expect(checkin_1.response).to eq('Answered')
    end

    it "can have a response of 'None' " do
      checkin_1 = Checkin.new({category: 0, time: DateTime.now, response: 2})
      expect(checkin_1.response).to eq('None')
    end
  end
end
