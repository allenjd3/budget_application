class CsvUploadersController < ApplicationController
  require 'csv'
  before_action :set_csv_uploader, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /csv_uploaders
  # GET /csv_uploaders.json
  def index
    @csv_uploaders = CsvUploader.all
  end

  # GET /csv_uploaders/1
  # GET /csv_uploaders/1.json
  def show
    @csvheaders = CSV.parse(CsvUploader.find(params[:id]).csvbank.download)[0] 

  end

  def add_transactions
    @csvbanks = CSV.parse(CsvUploader.find(params[:id]).csvbank.download)
    @listofthings = []
    #@csvbanks.each do |csv|
    #  @listofthings.push(csv[params[:description]])
    #end
    @listofthings.push("hello")
    @listofthings



  end

  # GET /csv_uploaders/new
  def new
    @months = Month.where(user_id: current_user.id).all
    @csv_uploader = CsvUploader.new
  end

  # GET /csv_uploaders/1/edit
  def edit
  end

  # POST /csv_uploaders
  # POST /csv_uploaders.json def create
  def create
    @csv_uploader = CsvUploader.new(csv_uploader_params)

    respond_to do |format|
      if @csv_uploader.save
        format.html { redirect_to @csv_uploader, notice: 'Csv uploader was successfully created.' }
        format.json { render :show, status: :created, location: @csv_uploader }
      else
        format.html { render :new }
        format.json { render json: @csv_uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /csv_uploaders/1
  # PATCH/PUT /csv_uploaders/1.json
  def update
    respond_to do |format|
      if @csv_uploader.update(csv_uploader_params)
        format.html { redirect_to @csv_uploader, notice: 'Csv uploader was successfully updated.' }
        format.json { render :show, status: :ok, location: @csv_uploader }
      else
        format.html { render :edit }
        format.json { render json: @csv_uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csv_uploaders/1
  # DELETE /csv_uploaders/1.json
  def destroy
    @csv_uploader.destroy
    respond_to do |format|
      format.html { redirect_to csv_uploaders_url, notice: 'Csv uploader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_csv_uploader
      @csv_uploader = CsvUploader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def csv_uploader_params
      params.require(:csv_uploader).permit(:month_id, :name, :csvbank)
    end
end
