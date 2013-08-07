class TasksController < ApplicationController

  def index
  	@tasks = Task.all
    @task = Task.new
  end

  def create
  	@task = Task.new(task_params)
  	if @task.save
  	 redirect_to tasks_path, notice: "Your task has been successfully added."
    else
      redirect_to :back, notice: "There was an error creating your task."
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to tasks_path, notice: "Your task has been successfully updated."
    else
      redirect_to :back, notice: "There was an error updating your task."
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task has been deleted" }
      format.js
    end
  end
  private

  	def task_params
  		params.require(:task).permit(:description)
  	end
end
