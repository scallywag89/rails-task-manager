class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def marked?
    if params[:completed] == '1'
      return true
    else
      return false
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.completed = marked?
    @task.update(task_params)
    redirect_to task_path(@task)
  end


  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
