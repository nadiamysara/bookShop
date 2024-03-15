class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments or /payments.json
  def index
    if current_user.admin?
      @payments = Payment.all
    else
      @payments = Payment.where(user_id: current_user.id)
    end
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
        redirect_url: "https://webhook.site/86cb02c4-8a44-4009-a0d0-f4a8d48e734c",
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
    if @payment.save
      params = {
        order_number: @payment.order_number,
        buyer_name: @payment.buyer_name,
        buyer_email: @payment.buyer_email,
        buyer_phone: @payment.buyer_phone,
        transaction_amount: @payment.transaction_amount,
        product_description: @payment.product_description,
        redirect_url: "https://webhook.site/86cb02c4-8a44-4009-a0d0-f4a8d48e734c",
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

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy!

    respond_to do |format|
      format.html { redirect_to payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
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
end
