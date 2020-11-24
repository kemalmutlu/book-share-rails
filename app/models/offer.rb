class Offer < ApplicationRecord
  belongs_to :book
  belongs_to :recomemded_book, class_name: 'Book', foreign_key: :recommended_book_id
  
  enum status: { approved: 1, rejected: 2, waiting: 3 }
end
