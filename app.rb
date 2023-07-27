require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'rental'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'

class Ap
  def initialize(choice, books = [], people = [])
    @choice = choice
    @book = book
    @people = people
  end

  def run
    loop do
      puts @choice
      choice = UserInput.getNumber('', 'Please enter relevant number')
      case choice
      when 1
        puts 'Add a book'
        title = UserInput.getString('Enter title', 'Please enter a title')
        author = UserInput.getString('Enter author', 'Please enter an author')
        @books << Book.new(title, author)
        puts "Book \"#{title}\" is created!\n\n"
      when 2
        puts 'Add a person'
        person_type = UserInput.get_number(
          'Enter 1 for student, 2 for teacher',
          'Please enter a number')
          case person_type
          when 1
            age = UserInput.getString('Age: ', 'Enter a valid number' )
            name = UserInput.getString('Enter name', 'Please enter a name')
            permission = UserInput.getBoolean('Parent permission(y/n): ', 'Enter y(yes)/n(no)')
            @people << Student.new(age, name, parent_permission: permission)
            puts "Student \"#{name}\" has been added!\n\n"
          when 2
            specialization = UserInput.getString('Specialization: ', 'Enter specialization')
            age = UserInput.getString('Age: ', 'Enter a valid number' )
            name = UserInput.getString('Enter name', 'Please enter a name')
            @people << Teacher.new(specialization, age, name)
            puts "Teacher \"#{name}\" has been added!\n\n"
          else
            puts 'Invalid input'
          end
      when 3
        puts 'Add a rental'
        date = UserInput.getString('Enter date', 'Please enter a date')
        book = UserInput.getString('Enter book', 'Please enter a book')
        person = UserInput.getString('Enter person', 'Please enter a person')
        @rentals << Rental.new(date, book, person)
      when 4
        puts 'List all books'
        @books.each do |book|
          puts book.title
        end
      when 5
        puts 'List all people'
        @people.each do |person|
          puts person.name
        end
      when 6
        puts 'List all rentals'
        @rentals.each do |rental|
          puts rental.date
        end
      when 7
        puts 'Exit'
        break
      else
        puts 'Invalid input'
      end
    end
  end
end