class TasksController < ApplicationController
  before_action :correct_task, only: [:edit, :show, :update, :destroy]

  def index
  	@tasks = Task.all
    @task = Task.new
  end

  def create
  	@task = Task.new(task_params)

    respond_to do |format|
    	if @task.save
    	  format.html { redirect_to tasks_path, notice: "Your task has been successfully added." }
      else
        format.html { redirect_to :back, notice: "There was an error creating your task." }
      end
      format.js
    end
  end

  def edit
  end

  def show
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to tasks_path, notice: "Your task has been successfully updated."
    else
      redirect_to :back, notice: "There was an error updating your task."
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task has been deleted" }
      format.js
    end
  end

  private

    def correct_task
      @task = Task.find(params[:id])
    end

  	def task_params
  		params.require(:task).permit(:description)
  	end
end
