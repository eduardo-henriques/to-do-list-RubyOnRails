class ToDoListController < ApplicationController
  def index
    @todos = ToDoList.where(list_id: params[:list_id])
  end

  def show
    @list = List.find(params[:list_id])
    @todo = @list.to_do_lists.find(params[:id])
  end

  def new
    @todo = ToDoList.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @todo = @list.to_do_lists.new(todo_params)

    if @todo.save
      redirect_to list_to_do_list_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @todo = @list.to_do_lists.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @todo = @list.to_do_lists.find(params[:id])

    if @todo.update(todo_params)
      redirect_to list_to_do_list_index_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = ToDoList.find(params[:id])
    @todo.destroy

    redirect_to list_to_do_list_index_path
  end

  private
  def todo_params
    params.require(:to_do_list).permit(:name,:description,:priority,:done,:list_id)
  end
end
