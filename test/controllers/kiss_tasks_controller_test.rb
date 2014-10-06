require 'test_helper'

class KissTasksControllerTest < ActionController::TestCase
  setup do
    @kiss_task = kiss_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kiss_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kiss_task" do
    assert_difference('KissTask.count') do
      post :create, kiss_task: { description: @kiss_task.description, name: @kiss_task.name, script: @kiss_task.script }
    end

    assert_redirected_to kiss_task_path(assigns(:kiss_task))
  end

  test "should show kiss_task" do
    get :show, id: @kiss_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kiss_task
    assert_response :success
  end

  test "should update kiss_task" do
    patch :update, id: @kiss_task, kiss_task: { description: @kiss_task.description, name: @kiss_task.name, script: @kiss_task.script }
    assert_redirected_to kiss_task_path(assigns(:kiss_task))
  end

  test "should destroy kiss_task" do
    assert_difference('KissTask.count', -1) do
      delete :destroy, id: @kiss_task
    end

    assert_redirected_to kiss_tasks_path
  end
end
