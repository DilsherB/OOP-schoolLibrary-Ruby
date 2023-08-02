require 'json'

# Include necessary class files
require_relative '../classes/person'
require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/book'
require_relative '../classes/rental'
require_relative 'user_input'
require_relative '../save_to_file'

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
      @books.each_with_index { |book, index| puts "#{index + 1}): 📚 Title: '#{book.title}', Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No person created yet'
      if File.exist?('./person.json')
        person = JSON.parse(File.read('./person.json'))
        puts "No person created yet" if person.empty?
        person.each do |p| 
          current_person =  "#{p[index]}): ID: #{p[id]}, Name: #{p[name]} Age: #{p[age]}"
          current_person += ", Specialization: #{p[specialization]}" if p.is_a?(Teacher)
          current_person += ", Classroom: #{p[classroom]}" if p.is_a?(Student)
          puts current_person
        end
      else
        puts "File 'person.json' doesn't exist"
      end
    else
      @people.each_with_index do |person, index|
        info = "#{index + 1}): [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        info += ", Specialization: #{person.specialization}" if person.is_a?(Teacher)
        info += ", Classroom: #{person.classroom}" if person.is_a?(Student)
        puts info
      end
    end
  end

  def create_person
    choice = get_user_input('Do you want to create a student(1) or a teacher(2)? [Input the number]:', :integer)

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
    age = get_user_input('Age: ', :integer)
    name = get_user_input('Name: ', :string)
    parent_permission = get_user_input('Has parent permission? [Y/N]: ', :boolean)
    classroom = get_user_input('Classroom: ', :string)
  
    student = Student.new(age, classroom, name, parent_permission: parent_permission)
    jsondata = { "age"=> age, "name"=>name, "parent_permission"=>parent_permission, "classroom"=>classroom }
    save_to_file('person.json', jsondata)
    @people << student
    puts "🎉 Student '#{name}' created successfully"
  end
  # def create_student
  #   age = get_user_input('Age: ', :integer)
  #   name = get_user_input('Name: ', :string)
  #   parent_permission = get_user_input('Has parent permission? [Y/N]: ', :boolean)
  #   classroom = get_user_input('Classroom: ', :string)
  #   student = Student.new(age, classroom, name, parent_permission: parent_permission)
  #   @people << student
  #   puts "🎉 Student '#{name}' created successfully"
  #   File.write('student.json', {age, name, parent_permission, classroom}, mode: 'a')
  #   # @people << student
  # end

  def create_teacher
    age = get_user_input('Age: ', :integer)
    name = get_user_input('Name: ', :string)
    specialization = get_user_input('Specialization: ', :string)
    teacher = Teacher.new(age, specialization, name)
    jsondata = { :age=> age, :name=>name, :specialization=>specialization }
    save_to_file('person.json', jsondata)
    puts "🎉 Teacher #{name} created successfully"
    @people << teacher
  end

  def create_book
    title = get_user_input('Title: ', :string)
    author = get_user_input('Author: ', :string)
    book = Book.new(title, author)
    jsondata = { :title=> title, :author=>author }
    save_to_file('book.json', jsondata)
    puts "🎉 Book #{title} created successfully"
    @books << book
  end

  def create_rental
    if @books.empty?
      puts 'No books available to rent'
    else
      display_books
      if @people.empty?
        puts 'No persons created. Kindly create a person before renting'
      else
        display_people
        date = get_user_input('Date: ', :string)
        Rental.new(date, @selected_book, @selected_person)
        jsondata = { "Book Name"=> @selected_book, "person"=>@selected_person, "date"=>date }
        save_to_file('rental.json', jsondata)
        puts '🎉 Rental created successfully'
      end
    end
  end

  def display_books
    list_all_books
    index = get_user_input('Select a book by number: ', :integer)
    @selected_book = @books[index - 1]
  end

  def display_people
    list_all_people
    index = get_user_input('Select a person by number: ', :integer)
    @selected_person = @people[index - 1]
  end

  def list_rentals_of_person
    id = get_user_input('ID of Person: ', :integer)
    person_selected = @people.find { |person| person.id == id }
    if person_selected.nil?
      puts 'No such person exists'
    else
      puts 'Rentals: '
      person_selected.rentals.each do |rental|
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
end