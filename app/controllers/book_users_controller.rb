class BookUsersController < ApplicationController
  before_action :set_book_user, only: %i[ show edit update destroy ]

  # GET /book_users or /book_users.json
  def index
    @book_users = BookUser.where(user_id:current_user.id)
  end

  # GET /book_users/1 or /book_users/1.json
  def show
  end

  # GET /book_users/new
  def new
    @book_user = BookUser.new
  end

  # GET /book_users/1/edit
  def edit
  end

  # POST /book_users or /book_users.json
  def create
    @book_user = BookUser.new(book_user_params)

    respond_to do |format|
      if @book_user.save
        format.html { redirect_to book_user_url(@book_user), notice: "Book user was successfully created." }
        format.json { render :show, status: :created, location: @book_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_users/1 or /book_users/1.json
  def update
    respond_to do |format|
      if @book_user.update(book_user_params)
        format.html { redirect_to book_user_url(@book_user), notice: "Book user was successfully updated." }
        format.json { render :show, status: :ok, location: @book_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_users/1 or /book_users/1.json
  def destroy
    @book_user.destroy!

    respond_to do |format|
      format.html { redirect_to book_users_url, notice: "Book user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_user
      @book_user = BookUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_user_params
      params.require(:book_user).permit(:user_id_id, :book_id_id, :due_date, :return_date, :status)
    end
end
