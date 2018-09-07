class EventsController < ApplicationController
  def index
    @events = Event.latest.paginate(page: params[:page], per_page: 10)
  end
end
