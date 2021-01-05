module Types
  module Enums
    class Category < Types::BaseEnum
      description "All types of checkins"

      value('wellness', 'A general check-in')
      value('medication', 'A reminder to take medications')
    end
  end
end
