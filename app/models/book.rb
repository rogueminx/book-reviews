class Book < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :title, :presence => true
  validates :author, :presence => true
  validates :rating, :presence => true
  before_save :convert_to_integer

  scope :featured, -> { where("featured =?", true)}

  scope :not_featured, -> { where("featured =?", false)}

  scope :high_rating, -> { where("rating >=?", 4).order("rating DESC")}

  scope :most_reviews, -> {(
    select("books.id, books.title, books.author, books.genre, books.rating, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("books.id")
    .order("reviews_count DESC")
    .limit(5)
    )}

private
  def convert_to_integer
    self.rating = rating.to_i
  end
end
