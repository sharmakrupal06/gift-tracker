class PeopleController < ApplicationController
  before_action :require_authentication
  before_action :set_person, only: [:show, :update, :destroy]

  def index
    @list_of_people = current_user.people.sort_by { |p| p.next_birthday }
    render({ :template => "person_templates/index" })
  end

  def show
    render({ :template => "person_templates/show" })
  end

  def new
    render({ :template => "person_templates/new" })
  end

  def create
    the_person = current_user.people.build
    the_person.name = params.fetch("query_name")
    the_person.birthday = params.fetch("query_birthday")
    the_person.relationship = params.fetch("query_relationship", nil)
    the_person.notes = params.fetch("query_notes", nil)

    if the_person.valid?
      the_person.save
      redirect_to("/people", { :notice => "Person created successfully." })
    else
      redirect_to("/people", { :alert => the_person.errors.full_messages.to_sentence })
    end
  end

  def update
    @the_person.name = params.fetch("query_name")
    @the_person.birthday = params.fetch("query_birthday")
    @the_person.relationship = params.fetch("query_relationship", nil)
    @the_person.notes = params.fetch("query_notes", nil)

    if @the_person.valid?
      @the_person.save
      redirect_to("/people/#{@the_person.id}", { :notice => "Person updated successfully." })
    else
      redirect_to("/people/#{@the_person.id}", { :alert => @the_person.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @the_person.destroy
    redirect_to("/people", { :notice => "Person deleted successfully." })
  end

  private

  def set_person
    @the_person = current_user.people.find(params[:id])
  end
end
