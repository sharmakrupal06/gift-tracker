class PeopleController < ApplicationController
  def index
    @list_of_people = Person.all.sort_by { |p| p.next_birthday }
    render({ :template => "person_templates/index" })
  end

  def show
    the_id = params[:id]

    matching_people = Person.where({ :id => the_id })

    @the_person = matching_people.at(0)

    render({ :template => "person_templates/show" })
  end

  def new
    render({ :template => "person_templates/new" })
  end

  def create
    the_person = Person.new
    the_person.name = params.fetch("query_name")
    the_person.birthday = params.fetch("query_birthday")

    if the_person.valid?
      the_person.save
      redirect_to("/people", { :notice => "Person created successfully." })
    else
      redirect_to("/people", { :alert => the_person.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params[:id]
    the_person = Person.where({ :id => the_id }).at(0)

    the_person.name = params.fetch("query_name")
    the_person.birthday = params.fetch("query_birthday")

    if the_person.valid?
      the_person.save
      redirect_to("/people/#{the_person.id}", { :notice => "Person updated successfully." })
    else
      redirect_to("/people/#{the_person.id}", { :alert => the_person.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params[:id]
    the_person = Person.where({ :id => the_id }).at(0)

    the_person.destroy

    redirect_to("/people", { :notice => "Person deleted successfully." })
  end
end
