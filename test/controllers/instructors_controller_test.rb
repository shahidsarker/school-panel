require 'test_helper'

class InstructorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instructor = instructors(:one)
  end

  test "should get index" do
    get instructors_url
    assert_response :success
  end

  test "should get new" do
    get new_instructor_url
    assert_response :success
  end

  test "should create instructor" do
    assert_difference('Instructor.count') do
      post instructors_url, params: { instructor: { age: @instructor.age, avatar: @instructor.avatar, created_at: @instructor.created_at, education: @instructor.education, first_name: @instructor.first_name, last_name: @instructor.last_name, salary: @instructor.salary, updated_at: @instructor.updated_at } }
    end

    assert_redirected_to instructor_url(Instructor.last)
  end

  test "should show instructor" do
    get instructor_url(@instructor)
    assert_response :success
  end

  test "should get edit" do
    get edit_instructor_url(@instructor)
    assert_response :success
  end

  test "should update instructor" do
    patch instructor_url(@instructor), params: { instructor: { age: @instructor.age, avatar: @instructor.avatar, created_at: @instructor.created_at, education: @instructor.education, first_name: @instructor.first_name, last_name: @instructor.last_name, salary: @instructor.salary, updated_at: @instructor.updated_at } }
    assert_redirected_to instructor_url(@instructor)
  end

  test "should destroy instructor" do
    assert_difference('Instructor.count', -1) do
      delete instructor_url(@instructor)
    end

    assert_redirected_to instructors_url
  end
end
