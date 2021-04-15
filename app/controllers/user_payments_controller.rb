class UserPaymentsController < ApplicationController
  before_action :set_user_payment, only: %i[ show edit update destroy ]
  before_action :authenticate_user, only: [:create, :index]

  def index
    @user_payments = UserPayment.all
    @unpaid_payments = UserPayment.where(user:@current_user).where('status= ? OR status= ?', 'unpaid', 'cancelled')
  end

  def show
  end

  def new
    @user_payment = UserPayment.new
  end

  def edit
  end

  def create
    @user_payment = UserPayment.new(user_payment_params)
    @user_payment.user = @current_user
    respond_to do |format|
      if @user_payment.save
        format.html { redirect_to @user_payment, notice: "User payment was successfully created." }
        format.json { render :show, status: :created, location: @user_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_payment.update(user_payment_params)
        format.html { redirect_to @user_payment, notice: "User payment was successfully updated." }
        format.json { render :show, status: :ok, location: @user_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_payment.destroy
    respond_to do |format|
      format.html { redirect_to user_payments_url, notice: "User payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_user_payment
      @user_payment = UserPayment.find(params[:id])
    end

    def authenticate_user
      @current_user = User.find_by(email: 'test01@gmail.com')
    end  

    def user_payment_params
      params.require(:user_payment).permit(:user_id, :status, :issue_date, :payment_date)
    end
end
