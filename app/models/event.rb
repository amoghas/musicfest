class Event < ApplicationRecord
  mount_uploader :icon_path, ImageUploader
end
