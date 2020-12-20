require 'rails_helper'

RSpec.describe Group_User do
  describe "validations" do
    it {should validate_presence_of :user_id}
    it {should validate_presence_of :group_id}
  end
end