def save_to_file(filename, data)
  # Create an array to store the data
  File.open(filename, 'w') if !File.exist?(filename)
  json_array = []

  if !File.zero?(filename)
    # Read the existing data from the file
    file_data = File.read(filename)
    # Convert the file data to a JSON array
    json_array = JSON.parse(file_data)
  else
    # Create an empty array
    json_array = []
  end

  json_array.push(data)
  json_string = JSON.pretty_generate(json_array)
  File.write(filename, json_string)
end

# save_to_file(filename, data)
#   json_array = []
#   if File.exist?(filename)
    
#     File.open(filename)
#     if File.empty?(filename)
#       json_array.push(data)
#       json_string = JSON.pretty_generate(json_array)
#       File.write(filename, json_string)
#     else
#     file_data = File.read(filename)
#     json_array = JSON.parse(file_data)
#     json_array.push(data)
#     json_string = JSON.pretty_generate(json_array)
#     File.write(filename, json_string)
#     end
#   end
# end