def save_to_file(filename, data)
  # Create an array to store the data
  json_array = []

  # Check if the file exists
  if File.exist?(filename)

    # Read the existing data from the file
    file_data = File.read(filename)

    # Convert the file data to a JSON array
    json_array = JSON.parse(file_data)

    # Add the new data to the array

    # Convert the array of JSON hashes to a JSON string

    # Write the JSON string to the file
  else

    # Create the file
    File.open(filename, 'w') {}

    # Add the data to the array

    # Convert the array of JSON hashes to a JSON string

    # Write the JSON string to the file
  end
  json_array.push(data)
  json_string = JSON.pretty_generate(json_array)
  File.write(filename, json_string)
  File.write(filename, json_string)
end
