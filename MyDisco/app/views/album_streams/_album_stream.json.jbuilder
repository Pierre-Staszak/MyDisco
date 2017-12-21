json.extract! album_stream, :id, :album_id, :stream_id, :created_at, :updated_at
json.url album_stream_url(album_stream, format: :json)
