class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /items/new
  def new
    @categories = Category.all
    @item = Item.new
  end


  # POST /items
  # POST /items.json
  def create
    @item = Item.new()
    @item.name = params[:item][:name]
    @month = Month.where(user_id: current_user.id, month: params[:item][:item_month], year: params[:item][:item_year]).first
    @item.month_id = @month.id
    @item.planned = params[:item][:planned]
    @item.category_id = params[:item][:category_id]
    @item.user_id = current_user.id

    respond_to do |format|
      if @item.save
        format.html { 
          flash[:notice]="Successfully Created New Budget Item"
          redirect_back fallback_location: '/cp' 
        }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { redirect_to '/cp' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(name: params[:item][:name], planned: params[:item][:planned], category_id: params[:item][:category_id])
        format.html { 
          flash[:notice]="Successfully Updated the Budget Item"
          redirect_back fallback_location: '/cp' 
        }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to "/cp", notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :planned, :category_id, :item_month, :item_year)
    end
end
