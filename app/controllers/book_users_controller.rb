class BookUsersController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!
  before_action :set_book_user, only: %i[ show edit update destroy return_book void_fee ]

  # GET /book_users or /book_users.json
  def index
    if current_user.admin == true
    @pagy, @book_users = pagy(BookUser.all.reverse_order, items:10)
    else
    @pagy, @book_users = pagy(BookUser.where(user_id:current_user.id).reverse_order, items:10)
    end
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
        format.html { redirect_to book_user_url(@book_user), notice: "Record was successfully updated." }
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
      format.html { redirect_to book_users_url, notice: "Record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def return_book
    respond_to do |format|
      if @book_user.update(rent_status: false, return_date: DateTime.now)
        Book.find(@book_user.book_id).update(rent_status: false)
        @borrower = User.find(@book_user.user_id)
        @borrower.update(rent_limit: @borrower.rent_limit - 1)
        format.html { redirect_to book_user_url(@book_user), notice: "Book was successfully returned." }
        format.json { render :show, status: :ok, location: @book_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def void_fee
    respond_to do |format|
      if @book_user.update(due_status: false, price: 0.00)
        format.html { redirect_to book_user_url(@book_user), notice: "Due fee was successfully void." }
        format.json { render :show, status: :ok, location: @book_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_user
      @book_user = BookUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_user_params
      params.require(:book_user).permit(:user_id, :book_id, :due_date, :return_date, :rent_status, :due_status, :price)
    end

    # def payment_params
    #   params.require(:payment).permit(:book_user_id, :price, :order_number, :buyer_name, :buyer_email, :buyer_phone, :transaction_amount, :product_description, :callback_url, :redirect_url, :token, :redirect_post)
    # end
end
