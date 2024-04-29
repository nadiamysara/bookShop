class HomeController < ApplicationController
  def index
    @books = Book.all
    @latests = @books.limit(5).reverse_order
    @fictions = Book.where(id:BookGenre.where(genre_id:1).select(:book_id))
    @nonfictions = Book.where(id:BookGenre.where(genre_id:2).select(:book_id))
    # if user_signed_in?
    #   session[:user_id] = current_user.id
    # end
    # if user_signed_in?
    #   cookies[:user_id] = current_user.id
    # end
  end
end
