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
  print "1 to create a student\n2 to create a teacher\n [Input the number]:"
  choice = gets.chomp.to_i

  case choice
  when 1
    app.create_student
  when 2
    app.create_teacher
  else
    puts 'Invalid choice. Please try again.'
    create_person(app)
  end
end

def create_book(app)
  app.create_book
end

def create_rental(app)
  app.create_rental
end

def list_rentals_of_person(app)
  app.list_rentals_of_person
end

def exit_app(_)
  puts 'Thank you for using this app!'
  exit
end
