class BooksController < ApplicationController
  before_action :require_permission, only: [:edit, :update, :destroy]

  def index         
    redirect_to root_path
  end

  def show
    @book = Book.find(params[:id])
    @offer = Offer.where(book_id: params[:id]).or(Offer.where(recommended_book_id: params[:id])).first
  end

  def new   
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = current_user.books.build(book_params)
    
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
   
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :pagecount, :status, :user_id, :tradable)
  end

  def require_permission
    if current_user != Book.find(params[:id]).user
      redirect_to root_path
    end
  end
end
