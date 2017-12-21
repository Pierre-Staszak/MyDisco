require 'test_helper'

class AlbumArtistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album_artist = album_artists(:one)
  end

  test "should get index" do
    get album_artists_url
    assert_response :success
  end

  test "should get new" do
    get new_album_artist_url
    assert_response :success
  end

  test "should create album_artist" do
    assert_difference('AlbumArtist.count') do
      post album_artists_url, params: { album_artist: { album_id: @album_artist.album_id, artist_id: @album_artist.artist_id } }
    end

    assert_redirected_to album_artist_url(AlbumArtist.last)
  end

  test "should show album_artist" do
    get album_artist_url(@album_artist)
    assert_response :success
  end

  test "should get edit" do
    get edit_album_artist_url(@album_artist)
    assert_response :success
  end

  test "should update album_artist" do
    patch album_artist_url(@album_artist), params: { album_artist: { album_id: @album_artist.album_id, artist_id: @album_artist.artist_id } }
    assert_redirected_to album_artist_url(@album_artist)
  end

  test "should destroy album_artist" do
    assert_difference('AlbumArtist.count', -1) do
      delete album_artist_url(@album_artist)
    end

    assert_redirected_to album_artists_url
  end
end
