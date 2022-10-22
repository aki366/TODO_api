class Api::CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
    render "show.json.jb"
  end

  def index
    @comments = Comment.all
    render "index.json.jb"
  end

  def update
    comment = Comment.find(params[:id])
    return render json: { status: 200 } if comment.update(comment_params)
    render json: { status: 500 }
  end

  def create
    todo = Todo.find(params[:todo_id])
    comment = Comment.new(comment_params)
    comment.todo_id = todo.id
    return render json: { status: 200 } if comment.save
    render json: { status: 500 }
  end

  def destroy
    comment = Comment.find(params[:id])
    return render json: { status: 200 } if comment.destroy
    render json: { status: 500 }
  end

  private

    def comment_params
      params.require(:comment).permit(:text)
    end
end
