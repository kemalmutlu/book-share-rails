class DashboardController < ApplicationController
  def index
    @users_books_reviews = Comment.joins(:book)
                            .where(books: { user_id: current_user.id })
                              .order('created_at DESC')
    @user_offers = Offer.joins(:recomemded_book)
                        .where(books: { user_id: current_user.id })
                        .order('created_at DESC')

    @incoming_offers = Offer.joins(:book)
                            .where(books: { user_id: current_user.id })

  end

  def books
    @books = current_user.books.order('created_at DESC')
  end

end
