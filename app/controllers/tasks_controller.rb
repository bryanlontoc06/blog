class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_date
  before_action :get_category
  before_action :authenticate_user!

  # GET /tasks or /tasks.json
  def index
    @tasks = @category.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = @category.tasks.build
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks or /tasks.json
  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      flash[:notice] = "Task was successfully created"
      redirect_to category_path(@category.id)
    else
        render :new
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @task = Task.find(params[:id])
      if @task.update(task_params)
          flash[:notice] = "Task was successfully updated"
          redirect_to category_path(@category.id)
      else
          render :edit
      end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
      @task = Task.find(params[:id])
      @task.destroy
      flash[:notice] = "Task was successfully deleted!"
      redirect_to category_path(@category.id)
  end

  private
    #get category
    def get_category
      @category = Category.find(params[:category_id])
    end

    #set Date
    def set_date
      @current_date = Date.today
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:category_id, :name, :body, :task_date)
    end
end
