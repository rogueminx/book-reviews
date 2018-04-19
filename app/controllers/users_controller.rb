class UsersController < ApplicationController
  def index
    @books = Book.featured
    @book = @books.sample
    @rated = Book.high_rating
    if @user
      @user = User.find(params[:user_id])
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_books_path(@user)
      flash[:notice] = "Hello, #{@user.name} Id: #{@user.id}!"
    else
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:name)
  end
end
