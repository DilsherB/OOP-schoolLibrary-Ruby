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
  if File.exist?(filename)
    data = JSON.parse(File.read(filename))
  else
    data = []
  end
  data
end