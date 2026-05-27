class EventsController < ApplicationController
  before_action :require_authentication

  def create
    @the_person = current_user.people.find(params[:person_id])
    the_event = @the_person.events.build
    the_event.event_type = params.fetch("query_event_type")
    the_event.date = params.fetch("query_date")
    the_event.note = params.fetch("query_note", nil)

    if the_event.valid?
      the_event.save
      redirect_to("/people/#{@the_person.id}", { :notice => "Event added successfully." })
    else
      redirect_to("/people/#{@the_person.id}", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @the_person = current_user.people.find(params[:person_id])
    the_event = @the_person.events.find(params[:id])
    the_event.destroy
    redirect_to("/people/#{@the_person.id}", { :notice => "Event removed." })
  end
end
