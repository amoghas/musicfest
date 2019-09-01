json.extract! event, :id, :title, :description, :icon_path, :file_path, :bg_color, :txt_color, :starts_at, :ends_at, :created_at, :updated_at
json.url event_url(event, format: :json)
