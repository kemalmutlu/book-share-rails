class OffersController < ApplicationController
  before_action :check_current_user, only: [:new, :create]
  before_action :check_the_book_offer, only: [:new, :create]

  def new   
    @offer = Offer.new
    @book_to_offer = Book.find(params[:book_id])
    @user_tradable_books = current_user.books.can_be_tradable.collect { |book| [book.title, book.id] }
  end

  def create
    @book = Book.find(params[:book_id])
    
    @offer = @book.offers.build(offer_params)
    
    if @offer.save
      redirect_to root_path
    else
      render 'new'
    end
  end 

  def edit 
    @offer = Offer.find(params[:id])
    @book = Book.find(@offer.recommended_book_id) 
  end 

  def update 
    @offer = Offer.find(params[:id]) 

    if params[:answer] == "Reject"
      @offer.rejected!
    elsif params[:answer] == "Approve"
      @offer.approved!
    end 

    if @offer 
      redirect_to dashboard_index_url
    else
      render 'edit'
    end
  end 

  def list 
    @offers = Offer.all.order('created_at DESC') 
    render "offers/index"
  end 

  private
  def check_current_user
    if current_user == Book.find(params[:book_id]).user
      redirect_to root_path
    end
  end

  def check_the_book_offer  
    @offer = Offer.where(book_id: params[:book_id])
              .or(Offer.where(recommended_book_id: params[:book_id])).first
    
    if @offer 
      redirect_to root_path
    end 
  end 

  def offer_params
    params.require(:offer)
      .permit(:recommended_book_id)
  end
end
