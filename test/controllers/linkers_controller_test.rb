require 'test_helper'

class LinkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linker = linkers(:one)
  end

  test "should get index" do
    get linkers_url, as: :json
    assert_response :success
  end

  test "should create linker" do
    assert_difference('Linker.count') do
      post linkers_url, params: { linker: { book_id: @linker.book_id, destination_id: @linker.destination_id } }, as: :json
    end

    assert_response 201
  end

  test "should show linker" do
    get linker_url(@linker), as: :json
    assert_response :success
  end

  test "should update linker" do
    patch linker_url(@linker), params: { linker: { book_id: @linker.book_id, destination_id: @linker.destination_id } }, as: :json
    assert_response 200
  end

  test "should destroy linker" do
    assert_difference('Linker.count', -1) do
      delete linker_url(@linker), as: :json
    end

    assert_response 204
  end
end
