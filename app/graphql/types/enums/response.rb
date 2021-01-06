module Types
  module Enums
    class Response < Types::BaseEnum
      description "Response options"

      value('Pending', 'Window has not passed')
      value('Answered', 'Everything is OK!')
      value('None', 'Button was not pushed')
    end
  end
end
