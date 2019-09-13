class Event < ApplicationRecord
    mount_uploader :file_path, ImageUploader
end
