class HomeController < ApplicationController
  def index
    @books = Book.all.limit(5)
    @latests = @books.limit(5).reverse_order
    @genres = Genre.all
  end
end
