class AppDetailsController < ApplicationController
  before_action :login_required
  before_action :set_app_detail, only: [:show, :edit, :update, :destroy]

  # GET /app_details
  # GET /app_details.json
  def index
    @app_details = AppDetail.all
  end

  # GET /app_details/1
  # GET /app_details/1.json
  def show
  end

  # GET /app_details/new
  def new
    @app_detail = AppDetail.new
  end

  # GET /app_details/1/edit
  def edit
  end

  # POST /app_details
  # POST /app_details.json
  def create

    @app_detail = AppDetail.new(app_detail_params.merge(user_id: session[:user_id]))

    respond_to do |format|
      if @app_detail.save
        format.html { redirect_to @app_detail, notice: 'App detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @app_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @app_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_details/1
  # PATCH/PUT /app_details/1.json
  def update
    respond_to do |format|
      if @app_detail.update(app_detail_params)
        format.html { redirect_to @app_detail, notice: 'App detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @app_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_details/1
  # DELETE /app_details/1.json
  def destroy
    @app_detail.destroy
    respond_to do |format|
      format.html { redirect_to app_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_detail
      @app_detail = AppDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_detail_params
      params.require(:app_detail).permit(:name, :redirect_url, :client_id, :secret_code)
    end
end
