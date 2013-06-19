class TasksController < ApplicationController
  def index
    @task = Task.new
  	@tasks = Task.all
  end

  def create
  	@task = Task.new post_params
  	if @task.save
  	 redirect_to tasks_path, notice: "Your task has been successfully added."
    else
      redirect_to :back, notice: "There was an error creating your task."
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    task = Task.find params[:id]
    if task.update_attributes post_params
      redirect_to tasks_path, notice: "Your task has been successfully updated."
    else
      redirect_to :back, notice: "There was an error updating your task."
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task has been deleted"
  end
  private

  	def post_params
  		params.require(:task).permit(:task)
  	end
end
