class RenameReleaseDateToReleaseYear < ActiveRecord::Migration[7.1]
  def change
    rename_column :movies, :release_date, :release
  end
end
