class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    user_id = @book.user_id
    @reviews = @book.reviews
    @user = User.find(user_id) #this may be needed to route the user info to the create a new review page.
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

  def edit
    @book = Book.find(params[:id])
    user_id = @book.user_id
    @user = User.find(user_id)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update!(book_params)
      flash[:notice] = "Joy! Your book was updated!"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


private
  def book_params
    params.require(:book).permit(:author, :title, :genre, :rating, :featured)
  end

end
