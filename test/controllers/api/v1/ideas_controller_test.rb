require 'test_helper'

class Api::V1::IdeasControllerTest < ActionController::TestCase
  test "controller responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "index returns an array of records" do
    get :index, format: :json

    assert_kind_of Array, json_response
  end

  test "index returns the correct number of ideas" do
    get :index, format: :json

    assert_equal Idea.count, json_response.count
    # using json_response.count here makes it clear to other devs reading our test suite, and allows future
    # changes in fixtures without acquiring technical debt.
  end

  test "index contains ideas with the correct properties" do
    get :index, format: :json

    json_response.each do |idea|
      assert idea["title"]
      assert idea["body"]
      assert idea["quality"]
    end
  end

  test "controller show action responds to json" do
    id = ideas(:one).id

    get :show, id: id, format: :json
    assert_response :success
  end

  test "#show responds with a particular idea" do
    id = ideas(:one).id

    get :show, id: id, format: :json

    assert_equal id, json_response["id"]
  end

  test "#create adds an additional idea to the database" do
    assert_difference 'Idea.count', 1 do
      idea = { title: "New Idea", body: "Something" }

      post :create, idea: idea, format: :json
    end
  end

  test "#create returns the new idea" do
    idea = {title: "New Idea", body: "Something"}

    post :create, idea: idea, format: :json

    assert_equal idea[:title], json_response["title"]
    assert_equal idea[:body], json_response["body"]
    assert_equal "swill", json_response["quality"]
  end
end
