class CommentsController < ApplicationController
  before_action :require_permission, only: [:edit, :update]

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    
    respond_to do |format|
      if @comment.save
        format.js
      else 
        format.html { render action: "new" }
        format.js
      end 
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @book = Book.find(params[:book_id])
  end 

  def update 
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(:status => true)
      redirect_to dashboard_index_url, notice: 'Comment status was successfully updated.'
    else
      render 'edit'
    end
  end 

  private
  def comment_params
    params.require(:comment)
          .merge(user_id: current_user.id)
          .permit(:title, :content, :user_id)
  end

  def require_permission
    if current_user != Book.find(params[:book_id]).user
      redirect_to root_path
    end
  end
end
