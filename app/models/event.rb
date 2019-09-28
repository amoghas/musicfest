class Event < ApplicationRecord
  has_many :event_links ,:dependent => :destroy
  has_many :event_photos ,:dependent => :destroy

  accepts_nested_attributes_for :event_photos
  accepts_nested_attributes_for :event_links
  mount_uploader :file_path, ImageUploader

  scope :published, -> {
    where(published: true).order("created_at desc")
  }

  scope :editor_choice, ->{
    where(editor_choice: true).order("created_at desc")
  }


end
