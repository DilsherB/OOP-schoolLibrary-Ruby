# The following lines import the necessary classes from their respective files.
require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'rental'
require_relative 'book'
require_relative 'student'

# Create a new 'Person' object with age 22 and name 'maximilianus'
person = Person.new(22, 'maximilianus')

# Call the 'correct_name' method on the 'Person' object
p person.correct_name

# Create a new 'CapitalizeDecorator' object, passing the 'Person' object as an argument
capitalized_person = CapitalizeDecorator.new(person)

# Call the 'correct_name' method on the 'CapitalizedPerson' object
p capitalized_person.correct_name

# Create a new 'TrimmerDecorator' object, passing the 'CapitalizedPerson' object as an argument
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

# Call the 'correct_name' method on the 'CapitalizedTrimmedPerson' object
p capitalized_trimmed_person.correct_name

# TESTING ASSOCIATIONS
east = Classroom.new('east')
p east.label

student1 = Student.new(27, east, 'kelvin')
p student1.classroom.label
book1 = Book.new('Atomic Habits', 'James Clear')
p book1.title
rental1 = Rental.new('2020-03-01', book1, student1)
p(rental1.book.rentals.map(&:date))
p rental1.book.title
p rental1.person.name
p rental1.person.age
p rental1.date
