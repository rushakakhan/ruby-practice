class Book
  attr_reader :title, :author, :page_count

  def initialize(title = "Not set", author = "Noone", page_count = nil)
    @title = title
    @author = author
    @page_count = page_count
  end

  def title=(value)
    if value == ""
      raise "Title can't be blank!"
    else
      @title = value.to_s
    end
  end

  def author=(value)
    if value == ""
      raise "Author can't be blank!"
    else
      @author = value.to_s
    end
  end

  def page_count=(value)
    if value == ""
      raise "Page count can't be blank!"
    elsif value.to_i != value
      raise "Page count must be an integer!"
    else
      @page_count = value.to_i
    end
  end

  def to_s 
    @author ? "#{@title} by #{@author}, #{@page_count} pages" : "#{@title}, #{@page_count} pages"
  end
end

class Library

  attr_reader :books

  def initialize
    @books = []
  end

  def add_book(book)
    if @books.length == 18
      raise "Library can only contain 18 books"
    else
      @books << book
    end
  end

  def list
    @books.each do |book| 
      puts book.to_s
    end
  end

  def checkout_book(title_string)
    @books.each_with_index do |book, index|
      title = book.title.downcase
      if title.include?(title_string.downcase)
        return @books.delete_at(index)
      end
    end
    return nil
  end
end

class User
  attr_reader :name, :current_books

  def initialize 
    @name = "Anonymous"
    @current_books = []
  end

  def name=(value)
    if value == ""
      raise "Name can't be blank!"
    else
      @name = value
    end
  end

  def look_in_library(library)
    library.list
  end

  def take_book(library, title)
    book_to_take = library.checkout_book(title)
    if book_to_take == nil
      puts "No title found."
      return
    end
    @current_books << book_to_take
    puts "#{@name} took the book titled \"#{book_to_take.title}\"."
  end

  def place_book_by_index(library, index)
    book_to_place = @current_books.delete_at(index)
    library.add_book(book_to_place)       
  end

  def list_current_books
    if @current_books.length == 0
      puts "-----------------"
      puts " No books found."
      puts "-----------------"
    else
      @current_books.each do |book| 
        puts book.to_s
      end
      puts "------------------"
      puts "#{@current_books.length} book(s) found."
      puts "------------------"
    end
  end
end


class TestLibrary

  def initialize
    @test_library = Library.new
    @user = User.new
  end

  def init
    books = []
    File.open("books.txt") do |file|
      books = file.readlines
    end

    books.each do |book|
      book_info = book.split(' -- ')
      title = book_info.first
      author = book_info.last.split(", ").first
      page_count = book_info.last.split(", ").last.to_i

      new_book = Book.new(title, author, page_count)
      @test_library.add_book(new_book)
    end
    start_ui
  end

  def start_ui
    puts "Welcome to the Little Free Library!"

    print "What is your name? "

    input = gets.chomp

    puts "\n"
    puts "------------------"
    puts "Hello, #{input}!"
    puts "------------------"

    @user.name = input

    choices_ui
  end

  def choices_ui
    puts "\n"
    puts "What would you like to do?"
    puts "[1] - View all books"
    puts "[2] - Add a book to the library"
    puts "[3] - Take a book from the library"
    puts "[4] - View my books"
    puts "[exit]"

    choice = gets.chomp

    if choice.downcase == "exit"
      puts "Bye!"
      return
    end

    case choice.to_i
    when 1
      puts "\n"
      puts "Here's a list of all the books:"
      puts "\n"
      puts "------------------"
      @test_library.list
      puts "------------------"
      puts "\n"
      choices_ui
    when 2
      puts "\n"
      puts "Your books:"
      @user.current_books.each_with_index do |book, index|
        puts "[#{index}] - #{book.title} by #{book.author}"
      end
      
      index = -1
      while index.to_i < 0 || index > @user.current_books.length - 1
        print "What book did you want to return? "
        index = gets.chomp.to_i
      end

      @user.place_book_by_index(@test_library, index)
      choices_ui
    when 3
      print "What is the book's title? "
      title = gets.chomp
      @user.take_book(@test_library, title)
      choices_ui
    when 4
      puts "\n"
      puts "These are the books you have checked out:"
      puts "------------------"
      @user.list_current_books
      choices_ui
    else 
      puts "Input invalid: Please type '1', '2', '3, or 'exit'."
      choices_ui
    end
  end
end


new_library = TestLibrary.new
new_library.init