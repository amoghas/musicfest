class Event < ApplicationRecord
  mount_uploader :file_path, ImageUploader
  has_many :event_links ,:dependent => :delete_all
  has_many :event_photos ,:dependent => :delete_all

  accepts_nested_attributes_for :event_photos
  accepts_nested_attributes_for :event_links
  

  scope :published, -> {
    where(published: true).order("created_at desc")
  }

  scope :editor_choice, -> {
    where(editor_choice: true).order("created_at desc")
  }


end
