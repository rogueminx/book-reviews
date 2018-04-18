class User < ActiveRecord::Base
  has_many :books
  has_many :reviews

  validates :name, :presence => true
end
