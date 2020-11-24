class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @books = Book.can_be_listed.order('created_at DESC')
  end
end
