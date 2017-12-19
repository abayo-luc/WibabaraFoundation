class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, :only => [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
    render json: @events
  end


  def show
    render json: @event
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      render json: @event
    else 
      render json: @event.errors
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors
    end
  end

  def destroy
    @event.destroy
    render json: @events
  end

protected

  def event_params
    params.require(:event).permit(:event_title, :event_time, :description, :address)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
