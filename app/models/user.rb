class User < ApplicationRecord
  before_create :set_username
  
  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :offers, dependent: :destroy

  validates_length_of :set_username, 
  :minimum => 5, :maximum => 50, 
  presence: true,
  uniqueness: true
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_username
    self.username = self.email.split(/@/).first
  end
end
