class Event < ApplicationRecord
  has_many :event_links ,:dependent => :destroy
  has_many :event_photos ,:dependent => :destroy
  belongs_to :theme

  validates :title, :description, :djs , :location , :country,:file_path ,  presence: true

  accepts_nested_attributes_for :event_photos
  accepts_nested_attributes_for :event_links
  mount_uploader :file_path, ImageUploader

  scope :published, -> {
    where("published = ? " , true).order("created_at desc")
  }

  scope :upcoming_fests, ->{
    where("published = ? and editor_choice  = ? and theme_id is null " , true , false).order("created_at desc")

  }

  scope :themed_fests, -> {
     where("published = ? and editor_choice  = ? and theme_id is not null " , true , false).order("created_at desc")

  }

  scope :editor_choice, ->{
    where(editor_choice: true).order("created_at desc")
  }

  scope :simple_search, ->(q){
    where("title like ?  or description like ? " , "%#{q}%" , "%#{q}%")
  }

  scope :advance_search, ->(q){
    
  }


  def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end


end
