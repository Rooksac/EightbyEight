require "test_helper"

class StudentLessonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_lessons_index_url
    assert_response :success
  end

  test "should get show" do
    get student_lessons_show_url
    assert_response :success
  end

  test "should get create" do
    get student_lessons_create_url
    assert_response :success
  end

  test "should get update" do
    get student_lessons_update_url
    assert_response :success
  end

  test "should get destroy" do
    get student_lessons_destroy_url
    assert_response :success
  end
end
