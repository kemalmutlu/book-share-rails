class Book < ApplicationRecord
  validates :title, :author, presence: true
  validates :pagecount, :numericality => { :greater_than => 0 }
  has_and_belongs_to_many :categories
  validates :categories, :presence => true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :offers, dependent: :destroy

  scope :can_be_listed, -> {where(status: true)}
  scope :can_be_tradable, -> {where(status: true, tradable: true)}
end
