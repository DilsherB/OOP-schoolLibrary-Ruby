def save_to_file(filename, data)
  # Create an array to store the data
  File.open(filename, 'w') unless File.exist?(filename)
  json_array = []

  if File.empty?(filename)
    # Create an empty array
    json_array = []
  else
    # Read the existing data from the file
    file_data = File.read(filename)
    # Convert the file data to a JSON array
    json_array = JSON.parse(file_data)
  end

  json_array.push(data)
  json_string = JSON.pretty_generate(json_array)
  File.write(filename, json_string)
end
