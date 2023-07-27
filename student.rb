require_relative 'Person'

class Student < Person
  attr_accessor :class_room

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hookey
    puts '¯(ツ)/¯'
  end
end
