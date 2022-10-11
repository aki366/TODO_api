class Api::V1::TodosController < ApplicationController

  def show
    # render json: { status: 200, todos: Todo.find(params[:id]) }
    @todo = Todo.find(params[:id])
    render "show.json.jb"
  end

  def index
    # render json: { status: 200, todos: Todo.all }
    @todos = Todo.all
    render "index.json.jb"
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    # @todo = Todo.find(params[:team_id])
    @todo = Todo.new(todo_params)

    if @todo.save
      render "index.json.jb"
      # render json: { status: 200, todo: todo }
    else
      render "error.json.jb"
      # render json: { status: 500, message: "Todoの作成に失敗しました" }
    end
  end

  def destroy
    @todo = Todo.find(params[:id])

    if @todo.destroy
      render "index.json.jb"
      # render json: { status: 200, todo: todo }
    else
      render "error.json.jb"
      # render json: { status: 500, message: "Todoの削除に失敗しました" }
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:text)
    end
end
