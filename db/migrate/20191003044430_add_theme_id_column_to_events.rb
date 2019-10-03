class AddThemeIdColumnToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :theme_id, :integer
  end
end
