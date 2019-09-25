class AddColumnsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :editor_choice, :boolean
    add_column :events, :published, :boolean
    add_column :events, :theme, :string
  end
end
