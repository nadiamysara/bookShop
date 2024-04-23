class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_book, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  # GET /books or /books.json
  def index
    @books = Book.all
    @rents = BookUser.where(user_id: current_user)
  end

  # GET /books/1 or /books/1.json
  def show
    if params[:notice].present?
      flash[:notice] = params[:notice]
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def rent
    if @book.rent_status == false
      unless BookUser.where(user_id: current_user.id).find_by(due_status: true).present?
        if current_user.rent_limit < 2
          @rent = BookUser.new(user_id: current_user.id, book_id: @book.id, due_date: 1.month.from_now, rent_status: true)
          respond_to do |format|
            if @rent.save
              @book.update(rent_status: true)
              User.find(current_user.id).update(rent_limit: current_user.rent_limit + 1)
              BookPassDueJob.set(wait_until: 1.month.from_now).perform_later(@rent.id)
              format.html { redirect_to book_url(@book), notice: "Book was successfully rented." }
              format.json { render :show, status: :created, location: @book }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @book.errors, status: :unprocessable_entity }
            end
          end
        else
          respond_to do |format|
            format.html { redirect_to book_url(@book), alert: "You have reached the limit numbers of book you can borrow at a time. Please return at least one book to proceed." }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to book_url(@book), alert: "You cannot borrow anymore books if there are unpaid due fees. Please pay your due fees to continue borrowing." }
        end
      end
    elsif BookUser.find_by(book_id: @book.id).user_id == current_user.id
      respond_to do |format|
        format.html { redirect_to book_url(@book), alert: "You are currently renting this book. Please check the rent history for more detail." }
      end
    else
      respond_to do |format|
        format.html { redirect_to book_url(@book), alert: "This book is currently not available to be rented because someone else is currently borrowing it." }
      end
    end
  end

  def search
    @books = Book.where("title LIKE ?", "%" + params[:q] + "%")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :year, :desc, :author_id, :purchase_status, :purchase_url, :rent_status, :cover_path, :cover, genre_ids: [])
    end
end
