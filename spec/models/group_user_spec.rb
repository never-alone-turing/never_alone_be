require 'rails_helper'

RSpec.describe GroupUser do
  describe "validations" do
    it {should validate_presence_of :user_id}
    it {should validate_presence_of :group_id}
  end

  describe "relationships" do
    it {should belong_to :group}
    it {should belong_to :user}
  end
end