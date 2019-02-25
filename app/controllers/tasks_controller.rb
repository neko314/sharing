# frozen_string_literal: true

class TasksController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.group_id = params[:group_id]
    if @task.save
      redirect_to group_path(params[:group_id]), notice: "New task created successfully"
    else
      render "new", notice: "Creating new task failed"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to group_path(@task.group), notice: "Update task successfully"
    else
      render "edit", notice: "Updating task failed"
    end
  end

  def destroy
  end

  private
    def task_params
      params.require(:task).permit(:name)
    end
end
