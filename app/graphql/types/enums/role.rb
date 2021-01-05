module Types 
  module Enums
    class Role < Types::BaseEnum
      description "All user roles"

      value('user', 'general user role')
      value('caretaker', "user designated to monitor a 'long_ranger' user role")
      value('receiver', "user being monitored by 'caretaker'")
    end
  end
end