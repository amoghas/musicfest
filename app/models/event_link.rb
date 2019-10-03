class EventLink < ApplicationRecord
  belongs_to :event, class_name: ::Event ,required: false
  enum link_type: [:official_website , :tix_package ,:lineup_djs , :flight , :trian ,  :car_taxi, :bus , :ferry_bike , :official_package  , :package_resale ,:hotles ,:hostels , :shopping_cart , :facebook ,:instagram ,:twitter]

  mount_uploader :file_path, ImageUploader
  
  def display_name
    name.blank? ? link : name
  end 
end
