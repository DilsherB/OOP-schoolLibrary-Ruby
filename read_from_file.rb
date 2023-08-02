# if File.exist?('./book.json')
#   books = JSON.parse(File.read('./book.json'))
#   puts 'No books available' if books.empty?
#   books.each do |book|
#     puts "Title: '#{book['title']}', Author: '#{book['author']}'"
#   end
# else
#   puts "File 'book.json' doesn't exist"
# end

def read_from_file(filename)
  return unless File.exist?(filename)

  contents = File.read(filename)
  data = JSON.parse(contents)
  if filename == 'person.json'
    @people = data.map { |person| Person.new(person) }
  elsif filename == 'book.json'
    @books = data.map { |book| Book.new(book) }
  end
end
