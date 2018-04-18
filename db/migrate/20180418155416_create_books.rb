class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.column :title, :string
      t.column :author, :string
      t.column :genre, :string
      t.column :featured, :boolean
      t.column :rating, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
