class Api::V1::TodosController < ApplicationController

  def show
    @todo = Todo.find(params[:id])
    render "show.json.jb"
  end

  def index
    @todos = Todo.all
    render "index.json.jb"
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render "index.json.jb"
    else
      render "error.json.jb"
    end
  end

  def destroy
    @todo = Todo.find(params[:id])

    if @todo.destroy
      render "index.json.jb"
    else
      render "error.json.jb"
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:text)
    end
end