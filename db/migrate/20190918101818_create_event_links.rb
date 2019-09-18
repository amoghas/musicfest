class CreateEventLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :event_links do |t|
      t.string :name
      t.text :description
      t.text :link
      t.integer :link_type
      t.integer :event_id
    end
  end
end
