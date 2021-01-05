require 'rails_helper'

RSpec.describe Group do
  describe "Validation" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should have_many :checkins}
  end
end
