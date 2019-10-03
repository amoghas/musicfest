class AddFilePathToEventLink < ActiveRecord::Migration[5.0]
  def change
    add_column :event_links, :file_path, :string
  end
end
