json.extract! event, :id, :title, :description, :icon_path, :file_path, :bg_color, :txt_color, :starts_at, :ends_at, :country, :location, :website, :djs, :venue, :tags, :intro, :fb, :twitter, :instagram, :youtube, :packages, :shop_links, :hotels, :flight, :train, :bus, :created_at, :updated_at
json.url event_url(event, format: :json)
