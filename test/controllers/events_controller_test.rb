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
      post events_url, params: { event: { bg_color: @event.bg_color, bus: @event.bus, country: @event.country, description: @event.description, djs: @event.djs, ends_at: @event.ends_at, fb: @event.fb, file_path: @event.file_path, flight: @event.flight, hotels: @event.hotels, icon_path: @event.icon_path, instagram: @event.instagram, intro: @event.intro, location: @event.location, packages: @event.packages, shop_links: @event.shop_links, starts_at: @event.starts_at, tags: @event.tags, title: @event.title, train: @event.train, twitter: @event.twitter, txt_color: @event.txt_color, venue: @event.venue, website: @event.website, youtube: @event.youtube } }
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
    patch event_url(@event), params: { event: { bg_color: @event.bg_color, bus: @event.bus, country: @event.country, description: @event.description, djs: @event.djs, ends_at: @event.ends_at, fb: @event.fb, file_path: @event.file_path, flight: @event.flight, hotels: @event.hotels, icon_path: @event.icon_path, instagram: @event.instagram, intro: @event.intro, location: @event.location, packages: @event.packages, shop_links: @event.shop_links, starts_at: @event.starts_at, tags: @event.tags, title: @event.title, train: @event.train, twitter: @event.twitter, txt_color: @event.txt_color, venue: @event.venue, website: @event.website, youtube: @event.youtube } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
