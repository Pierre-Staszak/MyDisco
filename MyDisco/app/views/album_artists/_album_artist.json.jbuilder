json.extract! album_artist, :id, :album_id, :artist_id, :created_at, :updated_at
json.url album_artist_url(album_artist, format: :json)
