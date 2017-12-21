json.extract! artist, :id, :name, :country, :saw_live, :created_at, :updated_at
json.url artist_url(artist, format: :json)
