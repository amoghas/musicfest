class Event < ApplicationRecord
  has_many :event_links ,:dependent => :destroy
  has_many :event_photos ,:dependent => :destroy
  belongs_to :theme , required: false

  validates :title, :description, :djs , :genres, :location , :country,:file_path ,  presence: true

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
     where("id IN ( SELECT MAX(id)  FROM events where published = true   GROUP BY theme_id)  and theme_id is not null")
  }

  scope :editor_choice, ->{
    where(editor_choice: true).order("created_at desc")
  }

  scope :simple_search, ->(q){
    where("title like ?  or description like ? or djs like ? " , "%#{q}%" ,"%#{q}%" , "%#{q}%")
  }

  scope :adv_search, ->(q){
    scope = self.published
    scope = scope.where("title like (?)" ,"%#{q[:title]}%")  unless q[:title].blank?
    scope = scope.where("genres like (?)" ,"%#{q[:genres]}%")  unless q[:genres].blank?
    scope = scope.where("month(starts_at) = ?" ,"#{q[:month].to_i}")  unless q[:month].blank?
    unless q[:country].blank?
      country_codes = ISO3166::Country.all_names_with_codes.select{|k , v| v.include?("M")}.collect{|k | k.last}
      scope = scope.where(country: country_codes) unless country_codes.blank?
    end
    scope   
        
  }


  def country_name
    country_code = self.country
    return nil if country_code.blank?
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end


end
