require './app'

module Json_IO
  def writer
    @app.list_books.each do |book|
      json_book = JSON.generate(book)
      File.write("books.json", "#{json_book}\n", mode: "a")
    end
  end
end