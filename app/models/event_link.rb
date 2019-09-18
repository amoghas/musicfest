class EventLink < ApplicationRecord
  belongs_to :event, class_name: ::Event
  enum link_type: [:shop_links, :packages, :youtube_link ,:instagram_link , :facebook_link, :hotels , :flights ,:trains ,:bus , :website]
end
