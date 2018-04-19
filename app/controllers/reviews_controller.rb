class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    user_id = @book.user_id
    @user = User.find(user_id)
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    user_id = @book.user_id
    @user = User.find(user_id)

    @review = Review.new(review_params)
    @review.user_id = @user.id
    @review.book_id = @book.id
    if @review.save
      flash[:notice] = "Your review is added to the list"
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:description)
  end

end
