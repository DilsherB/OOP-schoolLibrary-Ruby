class Rental
  attr_accessor :date, :book, :person

  def initialize(date)
    @date = date
    @book = book
    book.Rental << self
    @person = person
    person.Rentals << self
  end
end