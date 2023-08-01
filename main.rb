require_relative 'app/app'
require_relative 'app/options'

def get_integer_input(prompt)
  print prompt
  gets.chomp.to_i
end

def get_string_input(prompt)
  print prompt
  gets.chomp
end

def get_boolean_input(prompt)
  print prompt
  input = gets.chomp.downcase
  input != 'n'
end

def create_student(app)
  age = get_integer_input('Age: ')
  name = get_string_input('Name: ')
  parent_permission = get_boolean_input('Has parent permission? [Y/N]: ')
  classroom = get_string_input('Classroom: ')
  app.create_student(age, name, parent_permission, classroom)
end

def create_teacher(app)
  age = get_integer_input('Age: ')
  name = get_string_input('Name: ')
  specialization = get_string_input('Specialization: ')
  app.create_teacher(age, name, specialization)
end

def create_book(app)
  title = get_string_input('Title: ')
  author = get_string_input('Author: ')
  app.create_book(title, author)
end

def create_rental(app)
  app.display_books
  if app.books.empty?
    puts 'No books available to rent'
  else
    puts 'Choose a book from the following list.'
    book_index = get_integer_input('Enter the index of the book: ')
    selected_book = app.books[book_index]

    app.display_people
    if app.people.empty?
      puts 'No persons created. Kindly create a person before renting'
    else
      puts 'Choose a person from the following list.'
      person_index = get_integer_input('Enter the index of the person: ')
      selected_person = app.people[person_index]

      date = get_string_input('Date: ')
      app.create_rental(date, selected_book, selected_person)
    end
  end
end

def list_rentals_of_person(app)
  app.display_people
  if app.people.empty?
    puts 'No persons created.'
  else
    person_id = get_integer_input('Enter the ID of the person: ')
    app.list_rentals_of_person(person_id)
  end
end

def main
  app = App.new
  puts 'Welcome to the School Library App!'

  loop do
    puts "\nPlease choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create student"
    puts "4 - Create teacher"
    puts "5 - Create book"
    puts "6 - Create rental"
    puts "7 - List rentals of person"
    puts "8 - Exit app"

    number = gets.chomp.to_i

    case number
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      create_student(app)
    when 4
      create_teacher(app)
    when 5
      create_book(app)
    when 6
      create_rental(app)
    when 7
      list_rentals_of_person(app)
    when 8
      puts 'Thank you for using this app!'
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

main
