require_relative 'nameable'

class Person
  include Nameable
  attr_accessor :id, :name, :age

  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..10_000)
    @age = age
    @parent_permission = parent_permission
    @name = name
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @correct_name
  end
end
