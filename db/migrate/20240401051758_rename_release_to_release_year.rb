class RenameReleaseToReleaseYear < ActiveRecord::Migration[7.1]
  def change
    rename_column :movies, :release, :release_year
  end
end
