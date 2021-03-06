class MonthsController < ApplicationController
  before_action :set_month, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /months/new
  def new
    @month = Month.new
  end

  # POST /months.json
  def create
    @old_month = Month.order(id: :desc).take
    @month = Month.new
    @month.month = params[:month][:month]
    @month.year = params[:month][:year]
    @month.user_id = current_user.id

    respond_to do |format|
      if @month.save
        @old_month.categories.each do |category|
          @category = category.dup
          @category.month_id = @month.id
          @category.save

          category.items.each do |item|
            @item = item.dup
            @item.month_id = @month.id
            @item.category_id = @category.id
            @item.save
          end

        end

        format.html { redirect_to "/month/" + @month.month + "/year/" + @month.year.to_s, notice: 'Month was successfully created.' }
        format.json { render :show, status: :created, location: @month }
      else
        format.html { render :new }
        format.json { render json: @month.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /months/1
  # PATCH/PUT /months/1.json
  def update
    respond_to do |format|
      if @month.update(month_params)
        format.html { redirect_to "/month/" + @month.month + "/year/" + @month.year.to_s, notice: 'Month was successfully updated.' }
        format.json { render :show, status: :ok, location: @month }
      else
        format.html { redirect_back  fallback_location: '/cp' }
        format.json { render json: @month.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /months/1
  # DELETE /months/1.json
  def destroy
    @month.destroy
    respond_to do |format|
      format.html { redirect_to "/cp", notice: 'Month was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_month
      @month = Month.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def month_params
      params.require(:month).permit(:month, :year)
    end
end
