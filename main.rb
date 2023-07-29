require_relative './app/app'
require_relative './app/options'

def main
  app = App.new
  puts 'Welcome to the School Library App!'
  options(app)
end

main
