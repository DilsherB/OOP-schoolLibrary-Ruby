require_relative "Person"

class Student < Person
  attr_accessor :class_room
  
  def initialize(class_room)
    @class_room = class_room
  end