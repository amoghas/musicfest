class AddGenresColumnToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :genres, :string
  end
end
