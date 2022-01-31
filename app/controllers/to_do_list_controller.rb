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
    @todo = ToDoList.new(todo_params)

    if @todo.save
      redirect_to @todo
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @todo = ToDoList.find(params[:id])
  end

  def update
    @todo = ToDoList.find(params[:id])

    if @todo.update(name: params[:to_do_list][:name], description: params[:to_do_list][:description], priority: params[:to_do_list][:priority], done: params[:to_do_list][:done])
      redirect_to @todo
    else
      render :edit, status: :unprocessable_entity
  end

  def destroy
    @todo = ToDoList.find(params[:id])
    @todo.destroy

    redirect_to to_do_list_index_path
  end

  private
    def todo_params
      params.require(:to_do_list).permit(:name,:description,:priority,:done)
    end
end
