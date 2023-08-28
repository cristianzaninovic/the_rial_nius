require "test_helper"

class NiusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @niu = nius(:one)
  end

  test "should get index" do
    get nius_url
    assert_response :success
  end

  test "should get new" do
    get new_niu_url
    assert_response :success
  end

  test "should create niu" do
    assert_difference("Niu.count") do
      post nius_url, params: { niu: { content: @niu.content, headline: @niu.headline, nius_user_id: @niu.nius_user_id, title: @niu.title } }
    end

    assert_redirected_to niu_url(Niu.last)
  end

  test "should show niu" do
    get niu_url(@niu)
    assert_response :success
  end

  test "should get edit" do
    get edit_niu_url(@niu)
    assert_response :success
  end

  test "should update niu" do
    patch niu_url(@niu), params: { niu: { content: @niu.content, headline: @niu.headline, nius_user_id: @niu.nius_user_id, title: @niu.title } }
    assert_redirected_to niu_url(@niu)
  end

  test "should destroy niu" do
    assert_difference("Niu.count", -1) do
      delete niu_url(@niu)
    end

    assert_redirected_to nius_url
  end
end
