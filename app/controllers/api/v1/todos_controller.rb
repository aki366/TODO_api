class Api::V1::TodosController < ApplicationController
  def index
    render json: { status: 200, todos: Todo.all }
  end

  def create
    todo = Todo.new(todo_params)

    if todo.save
      render json: { status: 200, todo: todo }
    else
      render json: { status: 500, message: "Todoの作成に失敗しました" }
    end
  end

  def destroy
    todo = Todo.find(params[:id])

    if todo.destroy
      render json: { status: 200, todo: todo }
    else
      render json: { status: 500, message: "Todoの削除に失敗しました" }
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:text)
    end
end
