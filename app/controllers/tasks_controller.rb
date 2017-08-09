class TasksController < ApplicationController

    def index
        @task = Task.new
        #@tasks = Task.all
        @tasks = Task.order(id: :desc)
    end

    def create
        t = Task.new(params[:task].permit(:title, :id, :is_complete, :due,:priority ,:category))
        t.save
        redirect_to tasks_url
    end
    
    def edit
        @task = Task.find(params[:id])
          @tasks = Task.order(id: :desc)
        render 'index'
    end
    
    
    def show
    end
  
    def update
        task = Task.find(params[:id])
        task.update(params[:task].permit(:title, :id, :is_complete, :due,:priority ,:category))
        redirect_to tasks_url
    end
    
    def destroy
        t = Task.find(params[:id])
        t.destroy
        redirect_to tasks_url
    end
    

end
