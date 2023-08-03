# if File.exist?('./book.json')
#   books = JSON.parse(File.read('./book.json'))
#   puts 'No books available' if books.empty?
#   books.each do |book|
#     puts "Title: '#{book['title']}', Author: '#{book['author']}'"
#   end
# else
#   puts "File 'book.json' doesn't exist"
# end

# def get_data(filename)
#   json_array = []
#   if File.exist?(filename)
#     file_data = File.read(filename)
#     json_array = JSON.parse(file_data)
#   else
#     json_array = []
#   end
#   return json_array
# end

# def show_data(filename)
#   json_array = get_data(filename)
#   puts "Data from file #{filename}:"
#   if json_array.empty?
#     puts 'File is empty'
#   else
#     json_array.each do |data|
#       puts data.keys.join(': ')
#       puts data.values.join(', ')
#       puts
#     end
#   end
# end

def get_data(filename)
  json_array = []
  if File.exist?(filename)
    file_data = File.read(filename)
    json_array = JSON.parse(file_data)
  else
    json_array = []
  end
  return json_array
end

def show_data(filename)
  json_array = get_data(filename)
  puts "Data from file #{filename}:"
  if json_array.empty?
    puts 'File is empty'
  else
    json_array.each do |data|
      puts data.keys.join(': ')
      puts data.values.join(', ')
      puts
    end
  end
end
