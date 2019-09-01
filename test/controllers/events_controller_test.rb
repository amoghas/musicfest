require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { bg_color: @event.bg_color, description: @event.description, ends_at: @event.ends_at, file_path: @event.file_path, icon_path: @event.icon_path, starts_at: @event.starts_at, title: @event.title, txt_color: @event.txt_color } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { bg_color: @event.bg_color, description: @event.description, ends_at: @event.ends_at, file_path: @event.file_path, icon_path: @event.icon_path, starts_at: @event.starts_at, title: @event.title, txt_color: @event.txt_color } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
