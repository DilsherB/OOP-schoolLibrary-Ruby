# def save_to_file(filename, data)
#   # File.open(filename, 'w')
#   # File.write(filename, JSON.pretty_generate(data), mode: 'a')
#   jsondata = JSON.pretty_generate(data)
#   File.write(filename, jsondata, mode: 'a')
#   print "\n"
# end

# def save_to_file(filename, data)
#   # Create an array to store the data
#   if File.zero?(filename)
#     json_array = []

#     # Add the data to the array
#     json_array.push(data)

#     # Convert the array of JSON hashes to a JSON string
#     json_string = JSON.pretty_generate(json_array)

#     # Write the JSON string to the file
#     File.write(filename, json_string, mode: 'a')
#   else
#     newData = File.write(filename, "File is not empty", mode: 'a')
#     json_array.push(newData)
#     # # Convert the data to a JSON string
#     # json_string = JSON.pretty_generate(data)
#     # puts "Saving #{data}..."
#     # # Write the JSON string to the file
#     # File.write(filename, json_string, mode: 'a')
#   end
#   print "\n"
# end

def save_to_file(filename, data)
  # Open the file in append mode
  file = File.open(filename, 'r')

  # Get the existing data from the file
  existing_data = file.read

  # If the file is empty, create a new array
  if existing_data.empty?
    json_array = []
  else
    # Convert the existing data to an array of JSON hashes
    json_array = JSON.parse(existing_data)
  end

  # Add the new data to the array
  json_array << data

  # Convert the array of JSON hashes to a JSON string
  json_string = JSON.pretty_generate(json_array)

  # Write the JSON string to the file
  File.write(json_string, 'w')
  file.close
end

