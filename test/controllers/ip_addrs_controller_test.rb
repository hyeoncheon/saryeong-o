require 'test_helper'

class IpAddrsControllerTest < ActionController::TestCase
  setup do
    @ip_addr = ip_addrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ip_addrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ip_addr" do
    assert_difference('IpAddr.count') do
      post :create, ip_addr: { addr: @ip_addr.addr, default: @ip_addr.default, server_id: @ip_addr.server_id }
    end

    assert_redirected_to ip_addr_path(assigns(:ip_addr))
  end

  test "should show ip_addr" do
    get :show, id: @ip_addr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ip_addr
    assert_response :success
  end

  test "should update ip_addr" do
    patch :update, id: @ip_addr, ip_addr: { addr: @ip_addr.addr, default: @ip_addr.default, server_id: @ip_addr.server_id }
    assert_redirected_to ip_addr_path(assigns(:ip_addr))
  end

  test "should destroy ip_addr" do
    assert_difference('IpAddr.count', -1) do
      delete :destroy, id: @ip_addr
    end

    assert_redirected_to ip_addrs_path
  end
end
