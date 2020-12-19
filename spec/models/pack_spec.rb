require 'rails_helper'

RSpec.describe Pack do
  describe "Validation" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
end