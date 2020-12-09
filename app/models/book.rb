class Book < ApplicationRecord
  validates :title, :author, presence: true
  validates :pagecount, :numericality => { :greater_than => 0 }
  has_and_belongs_to_many :categories
  validates :categories, :presence => true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :offers, dependent: :destroy

  scope :can_be_listed, -> {where(status: true)}

  scope :can_be_tradable, -> {
    joins("LEFT JOIN offers ON books.id = offers.recommended_book_id OR books.id = offers.book_id")
      .where("offers.recommended_book_id IS NULL")
      .where("offers.book_id IS NULL")
      .where("books.status = true")
      .where("books.tradable = true")
  }

  scope :not_in_any_category, -> {
    joins("LEFT JOIN books_categories ON books.id = books_categories.book_id")
      .where("books_categories.book_id IS NULL")
  }
end
