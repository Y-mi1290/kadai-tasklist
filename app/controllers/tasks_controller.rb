class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update]
  
  def index
      @tasks = Task.order(id: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def new
      @task = Task.new
  end

  def create
      
      @task = current_user.tasks.build(task_params
      )
      
      if @task.save
          flash[:success] = 'タスクが正常に投稿されました'
          redirect_to @task
      else
          flash.now[:denger] = 'タスクが正常に投稿されませんでした'
          render :new
      end
  end

  def edit
    
  end

  def update

    if @task.update(task_params)
       flash[:success] = 'タスクは正常に更新されました'
       redirect_to @task
    else
       flash.now[:danger] = 'タスクは更新されませんでした'
       render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
      params.require(:task).permit(:content, :status)
  end
end