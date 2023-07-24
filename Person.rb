class Person
    attr_accessor :id, :name, :age
    
  def initialize(name = "Unknown", age, parent_permission: true)
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = true
  end