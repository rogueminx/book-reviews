class Book < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :title, :presence => true
  validates :author, :presence => true
  validates :rating, :presence => true
  before_save :convert_to_integer

  # def self.sort_abc_by_title
  #
  #
  # end

private
  def convert_to_integer
    self.rating = rating.to_i
  end
end
