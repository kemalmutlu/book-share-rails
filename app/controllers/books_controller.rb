class BooksController < ApplicationController
  before_action :require_permission, only: [:edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    @offer = Offer.where(book_id: params[:id]).or(Offer.where(recommended_book_id: params[:id])).first
  end

  def new   
    @book = Book.new
    category_collection
  end

  def edit
    @book = Book.find(params[:id])
    category_collection
  end

  def create
    @book = current_user.books.build(book_params)
    @category = Category.where(id: params[:book]["categories"])
    @book.categories << @category

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      category_collection
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    @category = Category.where(id: params[:book]["categories"])

    # First remove all category
    @book.categories.destroy_all

    @book.categories << @category

    if @book.update(book_params)
      redirect_to dashboard_user_books_path, notice: 'Book was successfully updated.'
    else
      category_collection
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
   
    redirect_to dashboard_user_books_path, notice: 'Book was successfully destroyed.'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :pagecount, :status, :user_id, :tradable)
  end

  def category_collection
    @categories = Category.all.collect { |category| [category.name, category.id] }
  end

  def require_permission
    if current_user != Book.find(params[:id]).user
      redirect_to root_path
    end
  end
end
