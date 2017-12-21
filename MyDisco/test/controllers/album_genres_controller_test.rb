require 'test_helper'

class AlbumGenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album_genre = album_genres(:one)
  end

  test "should get index" do
    get album_genres_url
    assert_response :success
  end

  test "should get new" do
    get new_album_genre_url
    assert_response :success
  end

  test "should create album_genre" do
    assert_difference('AlbumGenre.count') do
      post album_genres_url, params: { album_genre: { album_id: @album_genre.album_id, genre_id: @album_genre.genre_id } }
    end

    assert_redirected_to album_genre_url(AlbumGenre.last)
  end

  test "should show album_genre" do
    get album_genre_url(@album_genre)
    assert_response :success
  end

  test "should get edit" do
    get edit_album_genre_url(@album_genre)
    assert_response :success
  end

  test "should update album_genre" do
    patch album_genre_url(@album_genre), params: { album_genre: { album_id: @album_genre.album_id, genre_id: @album_genre.genre_id } }
    assert_redirected_to album_genre_url(@album_genre)
  end

  test "should destroy album_genre" do
    assert_difference('AlbumGenre.count', -1) do
      delete album_genre_url(@album_genre)
    end

    assert_redirected_to album_genres_url
  end
end
