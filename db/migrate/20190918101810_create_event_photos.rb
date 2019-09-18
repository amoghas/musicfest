class CreateEventPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :event_photos do |t|
      t.string :name
      t.text :description
      t.text :file_path
      t.integer :event_id
    end
  end
end
