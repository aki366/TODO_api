class Api::TodosController < ApplicationController

  def show
    @todo = Todo.find(params[:id])
    render "show.json.jb"
  end

  def index
    @todos = Todo.all
    render "index.json.jb"
  end

  def update
    todo = Todo.find(params[:id])
    return render json: { status: 200 } if todo.update(todo_params)
    render json: { status: 500 }
  end

  def create
    todo = Todo.new(todo_params)
    return render json: { status: 200 } if todo.save
    render json: { status: 500 }
  end

  def destroy
    todo = Todo.find(params[:id])
    return render json: { status: 200 } if todo.destroy
    render json: { status: 500 }
  end

  private

    def todo_params
      params.require(:todo).permit(:text)
    end
end
