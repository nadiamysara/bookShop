class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments or /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)

    #respond_to do |format|
      if @payment.save

        params_api = {
          order_number: @payment.id,
          buyer_name: @payment.buyer_name,
          buyer_email: @payment.buyer_email,
          buyer_phone: @payment.buyer_phone,
          transaction_amount: @payment.transaction_amount,
          product_description: @payment.product_description,
          redirect_url: "",
          callback_url: "",
          uid: "96111c67-91fc-43dd-b3fa-ad2e3a323753",
          token: "9eoFDBenJ88_Zq2yzpqw",
          checksum: @payment.g_checksum,
          redirect_post: true
        }
        @payment.update(token: "9eoFDBenJ88_Zq2yzpqw", redirect_post: true, uid: "96111c67-91fc-43dd-b3fa-ad2e3a323753", checksum: @payment.g_checksum)
        redirect_post('https://sandbox.securepay.my/api/v1/payments', params: params_api)
        #redirect_to :root, notice: params_api
      else
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy!

    respond_to do |format|
      format.html { redirect_to payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def pay
    redirect_to "https://www.google.com", allow_other_host: true, :status => 302
  end

  # def pay
  #   #respond_to do |format|
  #   uid = "96111c67-91fc-43dd-b3fa-ad2e3a323753"
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
  #         order_number: @payment.book_user_id,
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

  #       redirect_post('https://sandbox.securepay.my/api/v1/payments', params: params_api, options: {authenticity_token: :auto})
  #       #format.html { redirect_to payment_url(@payment), notice: params_api }
  #       #end
  # end

  def payment_redirect
    #for payment status
    payment_status = params[:payment_status]
    if payment_status == "true"

    payment_id = params[:order_number]
    payment_params = {
      borang_id: borang_id,
      payment_status: params[:payment_status],
      payment_id: params[:payment_id],
      order_number: params[:order_number],
      buyer_name: params[:buyer_name],
      buyer_email: params[:buyer_email],
      buyer_phone: params[:buyer_phone],
      transaction_amount: params[:transaction_amount],
      status_url: params[:status_url],
      retry_url: params[:retry_url],
      receipt_url: params[:receipt_url]
    }

    @history = History.new(payment_params)
    @history.save

      @payment = Payment.find_by(id: params[:payment_id])
      redirect_to history_path(@history), notice: "Bayaran berjaya dibuat."
    else
    payment_id = params[:order_number]
    payment_params = {
      borang_id: borang_id,
      payment_status: params[:payment_status],
      payment_id: params[:payment_id],
      order_number: params[:order_number],
      buyer_name: params[:buyer_name],
      buyer_email: params[:buyer_email],
      buyer_phone: params[:buyer_phone],
      transaction_amount: params[:transaction_amount],
      status_url: params[:status_url],
      retry_url: params[:retry_url],
      receipt_url: params[:receipt_url]
    }

    @history = History.new(payment_params)
    @history.save

      @payment = Payment.find_by(id: params[:payment_id])
      redirect_to history_path(@history), notice: "Bayaran tidak berjaya dibuat. Sila klik URL ulangan untuk cuba lagi."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:book_user_id, :price, :buyer_name, :buyer_email, :buyer_phone, :transaction_amount, :product_description, :callback_url, :redirect_url, :token, :redirect_post)
    end
end
