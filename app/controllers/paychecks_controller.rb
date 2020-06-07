class PaychecksController < ApplicationController
  before_action :set_paycheck, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /paychecks
  # GET /paychecks.json
  def index
    @paychecks = Paycheck.all
  end

  # GET /paychecks/1
  # GET /paychecks/1.json
  def show
  end

  # GET /paychecks/new
  def new
    @paycheck = Paycheck.new
  end

  # GET /paychecks/1/edit
  def edit
  end

  # POST /paychecks
  # POST /paychecks.json
  def create
    @paycheck = Paycheck.new()

    @paycheck.name = params[:paycheck][:name]
    @month = Month.where(user_id: current_user.id, month: params[:paycheck][:paycheck_month], year: params[:paycheck][:paycheck_year]).first
    @paycheck.payday = params[:paycheck][:payday]
    @paycheck.payday_date = params[:paycheck][:payday_date]
    @paycheck.user_id = current_user.id
    @paycheck.month_id = @month.id

    respond_to do |format|
      if @paycheck.save
        format.html { redirect_to "/cp", notice: 'Paycheck was successfully created.' }
        format.json { render :show, status: :created, location: @paycheck }
      else
        format.html { redirect_back fallback_location: "/cp" }
        format.json { render json: @paycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paychecks/1
  # PATCH/PUT /paychecks/1.json
  def update
    respond_to do |format|
      if @paycheck.update(name: params[:paycheck][:name], payday: params[:paycheck][:payday], payday_date: params[:paycheck][:payday_date])
        format.html { redirect_back fallback_location: "/cp", notice: 'Paycheck was successfully updated.' }
        format.json { render :show, status: :ok, location: @paycheck }
      else
        format.html { redirect_back fallback_location: "/cp" }
        format.json { render json: @paycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paychecks/1
  # DELETE /paychecks/1.json
  def destroy
    @paycheck.destroy
    respond_to do |format|
      format.html { redirect_to paychecks_url, notice: 'Paycheck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paycheck
      @paycheck = Paycheck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paycheck_params
      params.require(:paycheck).permit(:name, :payday, :payday_date, :user_id)
    end
end
