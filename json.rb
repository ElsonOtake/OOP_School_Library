require './app'
require 'json'

module Json_IO
  def writer
    File.write("Data/books.json", "", mode: "w")
    File.write("Data/peoples.json", "", mode: "w")
    @app.list_books.each do |book|
      json_book = JSON.generate(book)
      File.write("Data/books.json", "#{json_book}\n", mode: "a")
    end
    @app.list_people.each do |people|
      json_peoples = JSON.generate(people)
      File.write("Data/peoples.json", "#{json_peoples}\n", mode: "a")
    end
  end
end