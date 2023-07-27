class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(name)
    @students.push(name)
    student.classroom = self
  end
end
