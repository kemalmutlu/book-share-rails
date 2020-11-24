class UsersController < ApplicationController
  def index 
    @users = User.order('username ASC')
  end 
  
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
  end 
end
