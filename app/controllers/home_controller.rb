class HomeController < ApplicationController
  def index
    @books = Book.all
    # if user_signed_in?
    #   session[:user_id] = current_user.id
    # end
    # if user_signed_in?
    #   cookies[:user_id] = current_user.id
    # end
  end
end
