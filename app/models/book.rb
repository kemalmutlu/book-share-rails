class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :offers, dependent: :destroy

  scope :can_be_listed, -> {where(status: true)}
  scope :can_be_tradable, -> {where(status: true, tradable: true)}
end
