class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(build_params)

    if @event.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(build_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    AttendedEventAttendee.where('attended_event_id = ?', @event.id).delete_all
    @event.destroy

    redirect_to :root
  end

  private

  def build_params
    params.require(:event).permit(:name, :event_date, :details, :location)
  end
end
