class UsersController < ApplicationController
  include Pagy::Backend
  before_action :set_user, only: %i[ editRecord updateRecord destroy ]
  # before_action :authenticate_user!

  # GET /users or /users.json
  def index
    @pagy, @users = pagy(User.all, items:10)
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def editRecord
  end

  # POST /users or /users.json
  def create
    # @user = User.new(user_params)

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to user_url(@user), notice: "User was successfully created." }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def updateRecord
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :editRecord, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      # @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def user_params
      #params.fetch(:user, {:email, :admin, :name, :phone, :rent_limit})
      params.require(:user).permit(:email, :admin, :name, :phone, :rent_limit)
    end
end
