class DropUnusedEventColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :bg_color
    remove_column :events, :txt_color
    remove_column :events, :website
    remove_column :events, :fb
    remove_column :events, :twitter
    remove_column :events, :instagram
    remove_column :events, :youtube
    remove_column :events, :packages
    remove_column :events, :shop_links
    remove_column :events, :hotels
    remove_column :events, :flight
    remove_column :events, :train
    remove_column :events, :bus
    remove_column :events, :theme
    remove_column :events, :icon_path
  end
end
