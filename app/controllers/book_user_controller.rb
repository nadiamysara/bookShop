class BookUserController < ApplicationController
  def index
    @bookUser = BookUser.all
  end

  def create
    @bookUser = BookUser.create(book_user_params)
  end

  def update

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_user
      @bookUser = BookUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_user_params
      params.require(:book_users).permit(:user_id, :book_id)
    end
end
