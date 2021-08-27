class AddDownloadCountToTemplate < ActiveRecord::Migration[6.1]
  def change
    add_column :templates, :download_count, :integer, :default => 0
  end
end
