class UsersController < ApplicationController
  def index
    @books = Book.featured # this calls the featured books from the scope in book.rb
    @book = @books.sample # this is the random sample of the featured books called above
    @rated = Book.high_rating # all the highly rated books called from the scope
    @most_reviewed = Book.most_reviews
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
