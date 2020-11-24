class Comment < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :book
  belongs_to :user

  scope :approved, -> {where(status: true)}
  scope :waiting_for_approval, -> (user_id) { where(status: false, user_id: user_id) }
end
