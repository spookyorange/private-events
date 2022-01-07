class AttendedEventAttendeesController < ApplicationController

  def show
    @event = Event.find(params[:id])
  end

  def create
    @attend = AttendedEventAttendee.new(attendation_params)
    @event = Event.find(attendation_params[:attended_event_id].to_i)
    if current_user.attended_event_ids.include?(@event.id.to_i)
      redirect_to @event
    else
      @attend.save!
      redirect_to @event
    end
  end

  private

  def attendation_params
    params.require(:attended_event_attendee).permit(:attendee_id, :attended_event_id)
  end

end
