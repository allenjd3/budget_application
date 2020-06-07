class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new()
    @month = Month.where(user_id: current_user.id, month: params[:category][:category_month], year: params[:category][:category_year]).first
    @category.name = params[:category][:name]
    @category.month_id = @month.id
    @category.user_id = current_user.id

    respond_to do |format|
      if @category.save
        format.html { 
          flash[:notice]="Successfully Created a New Category"
          redirect_back fallback_location: '/cp' 
        }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { redirect_back fallback_location: '/cp' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
    @month = Month.where(user_id: current_user.id, month: params[:category][:category_month], year: params[:category][:category_year]).first
    @category = Category.where(user_id: current_user.id, id: params[:id]).take
    if (@category.update(name: params[:category][:name]))
        format.html { 
          flash[:notice]="Successfully Updated Category"
          redirect_back fallback_location: '/cp'
        }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { redirect_back fallback_location '/cp'}
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :category_month, :category_year)
    end
end
