require 'test_helper'

class IdeasControllerTest < ActionDispatch::IntegrationTest
  test "ideas create action should create new idea" do
    @topic = topics(:topic0)
    assert_difference(`Idea.count`) do
      post topic_ideas_path(topic_id: @topic, idea: { title: 'test title', body: 'test_body' })
    end
    assert_response :redirect
    assert_redirected_to topic_path(@topic)
  end

  test "ideas show page should exist" do
    @idea = ideas(:idea0)
    get topic_idea_path(@idea.topic, @idea)
    assert_response :success
  end
end
