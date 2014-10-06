require 'test_helper'

class KissResultsControllerTest < ActionController::TestCase
  setup do
    @kiss_result = kiss_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kiss_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kiss_result" do
    assert_difference('KissResult.count') do
      post :create, kiss_result: { error: @kiss_result.error, kiss_task_id: @kiss_result.kiss_task_id, output: @kiss_result.output, server_id: @kiss_result.server_id, status: @kiss_result.status }
    end

    assert_redirected_to kiss_result_path(assigns(:kiss_result))
  end

  test "should show kiss_result" do
    get :show, id: @kiss_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kiss_result
    assert_response :success
  end

  test "should update kiss_result" do
    patch :update, id: @kiss_result, kiss_result: { error: @kiss_result.error, kiss_task_id: @kiss_result.kiss_task_id, output: @kiss_result.output, server_id: @kiss_result.server_id, status: @kiss_result.status }
    assert_redirected_to kiss_result_path(assigns(:kiss_result))
  end

  test "should destroy kiss_result" do
    assert_difference('KissResult.count', -1) do
      delete :destroy, id: @kiss_result
    end

    assert_redirected_to kiss_results_path
  end
end
