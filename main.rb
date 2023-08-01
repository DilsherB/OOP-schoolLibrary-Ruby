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
  gets.chomp.downcase != 'n'
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
  return puts 'No books available to rent' if app.books.empty?

  puts 'Choose a book from the following list.'
  book_index = get_integer_input('Enter the index of the book: ')
  selected_book = app.books[book_index]

  app.display_people
  return puts 'No persons created. Kindly create a person before renting' if app.people.empty?

  puts 'Choose a person from the following list.'
  person_index = get_integer_input('Enter the index of the person: ')
  selected_person = app.people[person_index]

  date = get_string_input('Date: ')
  app.create_rental(date, selected_book, selected_person)
end

def list_rentals_of_person(app)
  app.display_people
  return puts 'No persons created.' if app.people.empty?

  person_id = get_integer_input('Enter the ID of the person: ')
  app.list_rentals_of_person(person_id)
end

def print_welcome_message
  puts 'Welcome to the School Library App!'
end

def print_menu
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create student'
  puts '4 - Create teacher'
  puts '5 - Create book'
  puts '6 - Create rental'
  puts '7 - List rentals of person'
  puts '8 - Exit app'
end

def handle_menu_option(app, number)
  menu_options = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_student,
    4 => :create_teacher,
    5 => :create_book,
    6 => :create_rental,
    7 => :list_rentals_of_person,
    8 => :exit_app
  }

  if menu_options.key?(number)
    send(menu_options[number], app)
  else
    puts 'Invalid option. Please try again.'
  end
end

def main
  app = App.new
  print_welcome_message

  loop do
    print_menu
    number = get_integer_input('')

    handle_menu_option(app, number)
  end
end

main
