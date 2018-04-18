class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = User.find(params[:user_id])
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    render :display
  end

  def new
    @user = User.find(params[:user_id])
    @book = Book.new
  end

  def create
    @user = User.find(params[:user_id])
    @book = @user.books.new(book_params)
    if @book.save
      flash[:notice] = "Your book was added to the list"
      redirect_to user_books_path
    else
      render :new
    end
  end

private
  def book_params
    params.require(:book).permit(:author, :title, :genre, :rating, :featured)
  end

end
