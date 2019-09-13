class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    drop_table(:events, if_exists: true)
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :icon_path
      t.string :file_path
      t.string :bg_color
      t.string :txt_color
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :country
      t.string :location
      t.string :website
      t.string :djs
      t.string :venue
      t.string :tags
      t.string :intro
      t.string :fb
      t.string :twitter
      t.string :instagram
      t.string :youtube
      t.string :packages
      t.string :shop_links
      t.string :hotels
      t.string :flight
      t.string :train
      t.string :bus

      t.timestamps
    end
  end
end
