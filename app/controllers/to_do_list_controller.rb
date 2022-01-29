class ToDoListController < ApplicationController
  def index
    @todos = ToDoList.all
  end

  def show
    @todo = ToDoList.find(params[:id])
  end

  def new
    @todo = ToDoList.new
  end

  def create
    @todo = ToDoList.new(name:"...",description:"...",done:false,priority:"...")

    if @todo.save
      redirect_to @todo
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def todo_params
      params.require(:todo).permite(:name,:description,:priority,:done)
    end
end
