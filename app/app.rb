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
        info = "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        if person.is_a?(Teacher)
          info += " Specialization: #{person.specialization}"
        elsif person.is_a?(Student)
          info += " Classroom: #{person.classroom}"
        end
        puts info
      end
    end
  end

  def create_student(age, name, parent_permission, classroom)
    puts "🎉 Student '#{name}' created successfully"
    @people << Student.new(age, classroom, name, parent_permission: parent_permission)
  end

  def create_teacher(age, name, specialization)
    puts "🎉 Teacher '#{name}' created successfully"
    @people << Teacher.new(age, specialization, name)
  end

  def create_book(title, author)
    puts "🎉 Book '#{title}' created successfully"
    @books << Book.new(title, author)
  end

  def create_rental(date, selected_book, selected_person)
    Rental.new(date, selected_book, selected_person)
    puts '🎉 Rental created successfully'
  end

  def display_books
    list_all_books
  end

  def display_people
    list_all_people
  end

  def list_rentals_of_person(id)
    person_selected = @people.select { |person| person.id == id }.first
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
