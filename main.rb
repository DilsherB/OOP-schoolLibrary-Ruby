require_relative 'app/app'
require_relative 'app/options'

def main
  app = App.new

  puts 'Welcome to the School Library App!'

  # Call the options method to present the menu and handle user inputs
  options(app)
end

main
