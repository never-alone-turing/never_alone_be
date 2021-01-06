module Types
  module Enums
    class Category < Types::BaseEnum
      description "All types of checkins"

      value('Wellness', 'A general check-in')
      value('Medication', 'A reminder to take medications')
    end
  end
end
