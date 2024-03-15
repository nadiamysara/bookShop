class BookUsersController < ApplicationController
  before_action :set_book_user, only: %i[ show edit update destroy paying pay ]

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

  # def pay
  #   @payment = Payment.new
  # end

  # def paying
  #   #@payment = Payment.new(:book_user_id @book_user.id, :order_number @book_user.id, :buyer_name , :buyer_email, :buyer_phone, :transaction_amount, :product_description, :callback_url, :redirect_url, :token, :redirect_post)
  #   @payment = Payment.new(payment_params)
  #   respond_to do |format|
  #     if @payment.save
  #       uid = "96111c67-91fc-43dd-b3fa-ad2e3a323753"
  #       # checksum_token = "b6fe5d19b820e622b836aff46724ec37ab45b795e734fd6348a2432d7a5e06e9"
  #       # auth_token = "9eoFDBenJ88_Zq2yzpqw"
  #       # url = "https://sandbox.securepay.my/api/v1/payments"

  #       # callback_url = ""
  #       # redirect_url = "http://localhost:300"
  #       # token = auth_token
  #       # redirect_post = true

  #       # string = "#{@payment.buyer_email}|#{@payment.buyer_name}|#{@payment.buyer_phone}|#{@payment.order_number}|#{@payment.product_description}|#{@payment.transaction_amount}|96111c67-91fc-43dd-b3fa-ad2e3a323753"
  #       # checksum_token = "b6fe5d19b820e622b836aff46724ec37ab45b795e734fd6348a2432d7a5e06e9"
  #       # g_checksum = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, string)

  #       params_api = {
  #         order_number: @payment.id,
  #         buyer_name: @payment.buyer_name,
  #         buyer_email: @payment.buyer_email,
  #         buyer_phone: @payment.buyer_phone,
  #         transaction_amount: @payment.transaction_amount,
  #         product_description: @payment.product_description,
  #         #callback_url: "",
  #         #redirect_url: "",
  #         checksum: @payment.g_checksum,
  #         token: "9eoFDBenJ88_Zq2yzpqw",
  #         redirect_post: true
  #       }

  #       redirect_post('https://sandbox.securepay.my/api/v1/payments', params: params_api, options: {authenticity_token: "9eoFDBenJ88_Zq2yzpqw"})
  #       #format.html { redirect_to payment_url(@payment), notice: params_api }
  #     else
  #       format.html { redirect_to payment_url(@payment), notice: params_api }
  #     end
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_user
      @book_user = BookUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_user_params
      params.require(:book_user).permit(:user_id_id, :book_id_id, :due_date, :return_date, :status)
    end

    # def payment_params
    #   params.require(:payment).permit(:book_user_id, :price, :order_number, :buyer_name, :buyer_email, :buyer_phone, :transaction_amount, :product_description, :callback_url, :redirect_url, :token, :redirect_post)
    # end
end
