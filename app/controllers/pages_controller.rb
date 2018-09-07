class PagesController < ApplicationController
  def home
    @latest_events = Event.latest.limit(3)
  end
end
