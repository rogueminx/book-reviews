class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    render :display
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    
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
