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

def main
  app = App.new
  puts 'Welcome to the School Library App!'

  loop do
    option = options(app)

    case option
    when 1
      age = get_integer_input('Age: ')
      name = get_string_input('Name: ')
      parent_permission = get_boolean_input('Has parent permission? [Y/N]: ')
      classroom = get_string_input('Classroom: ')
      app.create_student(age, name, parent_permission, classroom)
    when 2
      age = get_integer_input('Age: ')
      name = get_string_input('Name: ')
      specialization = get_string_input('Specialization: ')
      app.create_teacher(age, name, specialization)
    when 3
      title = get_string_input('Title: ')
      author = get_string_input('Author: ')
      app.create_book(title, author)
    when 4
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
    when 5
      app.display_people
      if app.people.empty?
        puts 'No persons created.'
      else
        person_id = get_integer_input('Enter the ID of the person: ')
        app.list_rentals_of_person(person_id)
      end
    when 6
      break
    else
      puts 'Invalid option, please try again.'
    end
  end
end

main
