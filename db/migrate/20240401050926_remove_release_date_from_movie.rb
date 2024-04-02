class RemoveReleaseDateFromMovie < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :release_date, :string
  end
end
