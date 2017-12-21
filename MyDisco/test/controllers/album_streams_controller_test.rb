require 'test_helper'

class AlbumStreamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album_stream = album_streams(:one)
  end

  test "should get index" do
    get album_streams_url
    assert_response :success
  end

  test "should get new" do
    get new_album_stream_url
    assert_response :success
  end

  test "should create album_stream" do
    assert_difference('AlbumStream.count') do
      post album_streams_url, params: { album_stream: { album_id: @album_stream.album_id, stream_id: @album_stream.stream_id } }
    end

    assert_redirected_to album_stream_url(AlbumStream.last)
  end

  test "should show album_stream" do
    get album_stream_url(@album_stream)
    assert_response :success
  end

  test "should get edit" do
    get edit_album_stream_url(@album_stream)
    assert_response :success
  end

  test "should update album_stream" do
    patch album_stream_url(@album_stream), params: { album_stream: { album_id: @album_stream.album_id, stream_id: @album_stream.stream_id } }
    assert_redirected_to album_stream_url(@album_stream)
  end

  test "should destroy album_stream" do
    assert_difference('AlbumStream.count', -1) do
      delete album_stream_url(@album_stream)
    end

    assert_redirected_to album_streams_url
  end
end
