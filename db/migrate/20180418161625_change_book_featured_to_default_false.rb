class ChangeBookFeaturedToDefaultFalse < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :featured, :boolean, :default => false
  end
end
