require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'

class App
  attr_writer :list_of_people
  def initialize
    @list_of_people = []
    @list_of_books = []
    @list_of_rentals = []
    @classroom = Classroom.new('Math')
  end

  def list_books
    @list_of_books
  end

  def list_people
    @list_of_people
  end

  def create_new_student(age, name, parent_permission)
    student = Student.new(@classroom, age, name, parent_permission)
    @list_of_people << student
  end

  def create_new_teacher(specialization, age, name)
    teacher = Teacher.new(specialization, age, name)
    @list_of_people << teacher
  end

  def create_new_book(title, author)
    book = Book.new(title, author)
    @list_of_books << book
  end

  def create_new_rental(person, book, date)
    rental = Rental.new(person, book, date)
    @list_of_rentals << rental
  end

  def list_rentals_by_id(id)
    @list_of_rentals.select { |rental| rental.person.id == id }
  end
end
