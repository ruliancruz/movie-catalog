class AddColumnsToMovie < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :poster, :string
    add_column :movies, :release_status, :integer
    add_column :movies, :draft_status, :integer
  end
end
