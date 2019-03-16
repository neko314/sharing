# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @group = Group.find(params[:group_id])
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
    @group = Group.find(params[:group_id])
  end

  def update
    @group = Group.find(params[:group_id])
    if @task.update(task_params)
      redirect_to group_path(@group), notice: "Update task successfully"
    else
      render "edit", alert: "Updating task failed"
    end
  end

  def destroy
    if @task.destroy
      redirect_to group_path(@task.group), notice: "Destroy task"
    else
      redirect_to group_path(@task.group), alert: "Fail to destroy task"
    end
  end

  private
    def correct_user
      group = Group.find(params[:group_id])
      redirect_to root_path, alert: "You can't access" unless group.user_ids.include?(current_user.id)
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, assignments_attributes: [:id, :user_id, :day_id, :_destroy])
    end
end
