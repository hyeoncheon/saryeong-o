class KissResultsController < ApplicationController
  before_action :set_kiss_result, only: [:show, :edit, :update, :destroy]

  # GET /kiss_results
  # GET /kiss_results.json
  def index
    @kiss_results = KissResult.all
  end

  # GET /kiss_results/1
  # GET /kiss_results/1.json
  def show
  end

  # GET /kiss_results/new
  def new
    @kiss_result = KissResult.new
  end

  # GET /kiss_results/1/edit
  def edit
  end

  # POST /kiss_results
  # POST /kiss_results.json
  def create
    @kiss_result = KissResult.new(kiss_result_params)

    respond_to do |format|
      if @kiss_result.save
        format.html { redirect_to @kiss_result, notice: 'Kiss result was successfully created.' }
        format.json { render :show, status: :created, location: @kiss_result }
      else
        format.html { render :new }
        format.json { render json: @kiss_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kiss_results/1
  # PATCH/PUT /kiss_results/1.json
  def update
    respond_to do |format|
      if @kiss_result.update(kiss_result_params)
        format.html { redirect_to @kiss_result, notice: 'Kiss result was successfully updated.' }
        format.json { render :show, status: :ok, location: @kiss_result }
      else
        format.html { render :edit }
        format.json { render json: @kiss_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kiss_results/1
  # DELETE /kiss_results/1.json
  def destroy
    @kiss_result.destroy
    respond_to do |format|
      format.html { redirect_to kiss_results_url, notice: 'Kiss result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kiss_result
      @kiss_result = KissResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kiss_result_params
      params.require(:kiss_result).permit(:status, :output, :error, :kiss_task_id, :server_id)
    end
end
