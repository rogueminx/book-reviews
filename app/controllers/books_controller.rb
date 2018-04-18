class BooksController < ApplicationController
  def index
    @books = Book.all
    binding.pry
  end

  def show
    @book = Book.find(params[:id])
    render :display
  end

  def new
    @book = Book.new
    @user = User.find(params[:user_id])
  end

  def create
    @book = Book.new(book_params)
    @user = User.find(params[:user_id])
    binding.pry
    if @book.save
      flash[:notice] = "Your book was added to the list"
      redirect_to books_path
    else
      render :new
    end
  end

private
  def book_params
    params.require(:book).permit(:author, :title, :genre, :rating, :featured)
  end

end
