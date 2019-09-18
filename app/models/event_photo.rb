class EventPhoto < ApplicationRecord
  belongs_to :event, class_name: ::Event
  mount_uploader :file_path, ImageUploader
end
