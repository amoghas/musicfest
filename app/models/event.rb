class Event < ApplicationRecord
  has_many :event_links
  has_many :event_photos

  accepts_nested_attributes_for :event_photos
  accepts_nested_attributes_for :event_links
    mount_uploader :file_path, ImageUploader
end
