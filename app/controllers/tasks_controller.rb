class TasksController < ApplicationController
  before_action(:require_login)

  def index
    @tasks = current_user().tasks()
  end

  def new
    @task = current_user().tasks.new()
  end

  def create
    @task = current_user().tasks.new(task_params())

    if @task.save()
      redirect_to(tasks_path())
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def task_params
    params().require(:task).permit(:title)
  end
end
