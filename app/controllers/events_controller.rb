class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, :only => [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else 
      render :new
    end
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

protected

  def event_params
    params.require(:event).permit(:event_title, :event_time, :description, :address)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
