def save_to_file(filename, data)
  File.write(filename, JSON.generate(data), mode: 'a')
end