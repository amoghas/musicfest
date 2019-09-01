class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :icon_path
      t.string :file_path
      t.string :bg_color
      t.string :txt_color
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
