def options(app)
  menu_options = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_of_person,
    7 => :exit_app
  }

  loop do
    puts "\nPlease choose an option by entering a number:"
    menu_options.each { |key, option| puts "#{key} - #{option.to_s.capitalize.gsub('_', ' ')}" }
    number = gets.chomp.to_i

    if menu_options.key?(number)
      send(menu_options[number], app)
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

def list_all_books(app)
  app.list_all_books
end

def list_all_people(app)
  app.list_all_people
end

def create_person(app)
  print "1 to create a student\n2 to create a teacher\n [Input the number]: "
  choice = gets.chomp.to_i

  case choice
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
  else
    puts 'Invalid choice. Please try again.'
    create_person(app)
  end
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

def exit_app(_)
  puts 'Thank you for using this app!'
  exit
end
