class Book < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :title, :presence => true
  validates :author, :presence => true
  validates :rating, :presence => true
end
