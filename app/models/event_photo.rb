class EventPhoto < ApplicationRecord
  belongs_to :event, class_name: ::Event ,required: false
  mount_uploader :file_path, ImageUploader
end
