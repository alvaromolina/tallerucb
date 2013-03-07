require 'test_helper'

class CommentsSolutionsControllerTest < ActionController::TestCase
  setup do
    @comments_solution = comments_solutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments_solutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comments_solution" do
    assert_difference('CommentsSolution.count') do
      post :create, comments_solution: { comment: @comments_solution.comment, solution_id: @comments_solution.solution_id }
    end

    assert_redirected_to comments_solution_path(assigns(:comments_solution))
  end

  test "should show comments_solution" do
    get :show, id: @comments_solution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comments_solution
    assert_response :success
  end

  test "should update comments_solution" do
    put :update, id: @comments_solution, comments_solution: { comment: @comments_solution.comment, solution_id: @comments_solution.solution_id }
    assert_redirected_to comments_solution_path(assigns(:comments_solution))
  end

  test "should destroy comments_solution" do
    assert_difference('CommentsSolution.count', -1) do
      delete :destroy, id: @comments_solution
    end

    assert_redirected_to comments_solutions_path
  end
end
