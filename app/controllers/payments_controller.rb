class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  #for error when redirect from securepay
  skip_before_action :verify_authenticity_token, only: :redirect

  # GET /payments or /payments.json
  def index
    # if current_user.admin?
      @payments = Payment.all
    # else
    #   @payments = Payment.where(user_id: current_user.id)
    # end
  end

  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new()
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      params = {
        order_number: @payment.order_number,
        buyer_name: @payment.buyer_name,
        buyer_email: @payment.buyer_email,
        buyer_phone: @payment.buyer_phone,
        transaction_amount: @payment.transaction_amount,
        product_description: @payment.product_description,
        redirect_url: "http://localhost:3000/payments/#{@payment.id}/redirect",
        callback_url: "",
        uid: "96111c67-91fc-43dd-b3fa-ad2e3a323753",
        token: "9eoFDBenJ88_Zq2yzpqw",
        checksum: @payment.g_checksum,
        redirect_post: true
      }
      redirect_post('https://sandbox.securepay.my/api/v1/payments', params: params)
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy!

    respond_to do |format|
      format.html { redirect_to payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def redirect
    redirect_params = {
      source: params[:source],
      payment_status: params[:payment_status],
      payment_method: params[:payment_method],
      payment_mode: params[:payment_mode],
      order_number: params[:order_number],
      fpx_model: params[:fpx_model],
      transaction_fee: params[:transaction_fee],
      currency: params[:currency],
      fpx_debit_auth_code: params[:fpx_debit_auth_code],
      transaction_amount: params[:transaction_amount],
      transaction_amount_received: params[:transaction_amount_received],
      merchant_reference_number: params[:merchant_reference_number],
      exchange_number: params[:exchange_number],
      buyer_name: params[:buyer_name],
      buyer_phone: params[:buyer_phone],
      buyer_email: params[:buyer_email],
      payment_id: params[:payment_id],
      client_ip: params[:client_ip],
      status_url: params[:status_url],
      retry_url: params[:retry_url],
      receipt_url: params[:receipt_url],
      checksum: params[:checksum],
      params: params[:params]
    }
    @history = History.create(redirect_params)

    payment_status = params[:payment_status]
    if payment_status == true
      _notice = "Payment was a success"
    else
      _notice = "Payment failed"
    end
    # redirect_to payment_redirect_path(payment_id: @payment.id, id: @history.id), notice: _notice
    # redirect_to payment_redirect_path(@payment), notice: _notice
    redirect_to payments_path(@payment), notice: _notice
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:book_user_id, :buyer_name, :buyer_email, :buyer_phone, :transaction_amount, :product_description, :user_id, :order_number)
    end

    def redirect_params
      params.require(:payment).permit(:payment_id, :buyer_name, :buyer_email, :buyer_phone, :transaction_amount, :transaction_amount_received, :client_ip, :order_number, :source, :payment_status, :currency, :merchant_reference_number, :exchange_number, :status_url, :retry_url, :receipt_url, :checksum, :transaction_fee, :payment_mode, :payment_method, :fpx_model, :fpx_debit_auth_code, :params)
    end
end
