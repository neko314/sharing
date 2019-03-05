# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :current_user

  def new
    @task = Task.new
    Day.count.times { @task.assignments.new }
  end

  def create
    group = Group.find(params[:group_id])
    @task = group.tasks.new(task_params)
    if @task.save
      redirect_to group_path(@task.group), notice: "New task created successfully"
    else
      render "new", alert: "Creating new task failed"
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
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to group_path(@task.group), notice: "Destroy task"
    else
      redirect_to group_path(@task.group), notice: "Fail to destroy task"
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, assignments_attributes: [:id, :user_id, :day_id, :_destroy])
    end

    def correct_user
      group = Group.find(params[:group_id])
      redirect_to current_user, notice: "You can't access" unless group.user_ids.include?(current_user.id)
    end
end
