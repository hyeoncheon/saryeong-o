class KissTasksController < ApplicationController
  before_action :set_kiss_task, only: [:show, :edit, :update, :destroy]

  # GET /kiss_tasks
  # GET /kiss_tasks.json
  def index
    @kiss_tasks = KissTask.all
  end

  # GET /kiss_tasks/1
  # GET /kiss_tasks/1.json
  def show
  end

  # GET /kiss_tasks/new
  def new
    @kiss_task = KissTask.new
  end

  # GET /kiss_tasks/1/edit
  def edit
  end

  # POST /kiss_tasks
  # POST /kiss_tasks.json
  def create
    @kiss_task = KissTask.new(kiss_task_params)

    respond_to do |format|
      if @kiss_task.save
        format.html { redirect_to @kiss_task, notice: 'Kiss task was successfully created.' }
        format.json { render :show, status: :created, location: @kiss_task }
      else
        format.html { render :new }
        format.json { render json: @kiss_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kiss_tasks/1
  # PATCH/PUT /kiss_tasks/1.json
  def update
    respond_to do |format|
      if @kiss_task.update(kiss_task_params)
        format.html { redirect_to @kiss_task, notice: 'Kiss task was successfully updated.' }
        format.json { render :show, status: :ok, location: @kiss_task }
      else
        format.html { render :edit }
        format.json { render json: @kiss_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kiss_tasks/1
  # DELETE /kiss_tasks/1.json
  def destroy
    @kiss_task.destroy
    respond_to do |format|
      format.html { redirect_to kiss_tasks_url, notice: 'Kiss task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kiss_task
      @kiss_task = KissTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kiss_task_params
      params.require(:kiss_task).permit(:name, :description, :script)
    end
end
