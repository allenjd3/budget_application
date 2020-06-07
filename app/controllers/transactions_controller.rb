class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /transactions/new
  def new
    @items = Item.all
    @transaction = Transaction.new
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new()

    @transaction.name = params[:transaction][:name]
    @month = Month.where(user_id: current_user.id, month: params[:transaction][:transaction_month], year: params[:transaction][:transaction_year]).first
    @transaction.user_id = current_user.id
    @transaction.item_id = params[:transaction][:item_id]
    @transaction.month_id = @month.id
    @transaction.spent = params[:transaction][:spent]
    @transaction.spent_date = params[:transaction][:spent_date]
    respond_to do |format|
      if @transaction.save
        format.html { 
          flash[:notice]="Successfully Created New Budget Transaction"
          redirect_back fallback_location: '/category_items' 
        }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { 
          @items = Item.all
          render :new 
        }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(name: params[:transaction][:name], item_id: params[:transaction][:item_id], spent: params[:transaction][:spent], spent_date: params[:transaction][:spent_date])
        format.html { redirect_to "/cp", notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { redirect_back fallback_location: "/cp" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: "/cp", notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:name, :user_id, :item_id, :spent, :spent_date, :transaction_month, :transaction_year)
    end
end
