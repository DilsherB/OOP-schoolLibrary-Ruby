require_relative 'Person'

class Student < Person
  attr_accessor :class_room

  def initialize(class_room)
    super
    @class_room = class_room
  end

  def play_hookey
    puts '¯(ツ)/¯'
  end
end
