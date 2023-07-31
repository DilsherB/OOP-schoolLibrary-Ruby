# Include necessary class files
require_relative '../classes/person'
require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/book'
require_relative '../classes/rental'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
  end

  def list_all_books
    if @books.empty?
      puts 'No books available'
    else
      @books.each_with_index { |book, index| puts "#{index}) 📚 Title: '#{book.title}', Author: '#{book.author}'" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No person created yet'
    else
      @people.each_with_index do |person, index|
        if person.is_a?(Teacher)
          puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, +
          Age: #{person.age} , Specialization: #{person.specialization}"
        elsif person.is_a?(Student)
          puts "#{index}) [#{person.class} 🧍] Name: #{person.name}, ID: #{person.id}, +
          Age: #{person.age} , Classroom: #{person.classroom}"
        else
          puts "#{index}) [#{person.class} 👨‍🏫] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def create_person
    print "1 to create a student\n2 to create a teacher\n [Input the number]:"
    choice = gets.chomp.to_i

    case choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid choice. Please try again.'
      create_person
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase != 'n'
    print 'Classroom: '
    classroom = gets.chomp
    puts "🎉 Student '#{name}' created successfully"
    @people << Student.new(age, classroom, name, parent_permission: parent_permission)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    puts "🎉 Teacher '#{name}' created successfully"
    @people << Teacher.new(age, specialization, name)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    puts "🎉 Book '#{title}' created successfully"
    @books << Book.new(title, author)
  end

  def create_rental
    if @books.empty?
      puts 'No books available to rent'
    else
      puts 'Choose a book from the following list.'
      display_books

      if @people.empty?
        puts 'No persons created. Kindly create a person before renting'
      else
        puts 'Choose a person from the following list.'
        display_people

        print 'Date: '
        date = gets.chomp
        Rental.new(date, @selected_book, @selected_person)
        puts '🎉 Rental created successfully'
      end
    end
  end

  def display_books
    list_all_books
    index = gets.chomp.to_i
    @selected_book = @books[index]
  end

  def display_people
    list_all_people
    index = gets.chomp.to_i
    @selected_person = @people[index]
  end

  def list_rentals_of_person
    print 'ID of Person: '
    id = gets.chomp.to_i
    person_selected = @people.select { |person| person.id == id }.first
    if person_selected.nil?
      puts 'No such person exists'
    else
      puts 'Rentals: '
      person_selected.rentals.map do |rental|
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
end
