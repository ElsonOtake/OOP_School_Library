require './app'
require 'json'

module Json_IO
  def writer
    File.write("Data/books.json", "", mode: "w")
    File.write("Data/peoples.json", "", mode: "w")
    File.write("Data/rentals.json", "", mode: "w")

    @app.list_books.each do |book|
      json_book = JSON.generate(book)
      File.write("Data/books.json", "#{json_book}\n", mode: "a")
    end
    @app.list_people.each do |people|
      json_peoples = JSON.generate(people)
      File.write("Data/peoples.json", "#{json_peoples}\n", mode: "a")
    end
    @app.list_of_rentals.each do |rental|
      array_rental = [rental.person.name, rental.book.title, rental.date]
      json_rental = JSON.generate(array_rental)
      File.write("Data/rentals.json", "#{json_rental}\n", mode: "a")
    end
  end

  def reader_books
    books = []
    File.foreach("Data/books.json") do |line|
      books << JSON.parse(line, create_additions: true)
    end
    books
  end

  def reader_peoples
    peoples = []
    File.foreach("Data/peoples.json") do |line|
      peoples << JSON.parse(line, create_additions: true)
    end
     peoples
  end
  def reader_rental
    rentals= []
    File.foreach("Data/rentals.json") do |line|
      rental =  JSON.parse(line)
      person= @app.list_people.select { |p| p.name == rental[0] }
      books = @app.list_books.select { |b| b.title == rental[1]}
      rentals << @app.create_new_rental(person[0], books[0], rental[2])
    end
    rentals
  end
end