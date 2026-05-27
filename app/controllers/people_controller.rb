class PeopleController < ApplicationController
  def index
    matching_people = Person.all

    @list_of_people = matching_people.order({ :created_at => :desc })

    render({ :template => "person_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_people = Person.where({ :id => the_id })

    @the_person = matching_people.at(0)

    render({ :template => "person_templates/show" })
  end

  def create
    the_person = Person.new
    the_person.names = params.fetch("query_names")
    the_person.birthday = params.fetch("query_birthday")

    if the_person.valid?
      the_person.save
      redirect_to("/people", { :notice => "Person created successfully." })
    else
      redirect_to("/people", { :alert => the_person.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_person = Person.where({ :id => the_id }).at(0)

    the_person.names = params.fetch("query_names")
    the_person.birthday = params.fetch("query_birthday")

    if the_person.valid?
      the_person.save
      redirect_to("/people/#{the_person.id}", { :notice => "Person updated successfully." } )
    else
      redirect_to("/people/#{the_person.id}", { :alert => the_person.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_person = Person.where({ :id => the_id }).at(0)

    the_person.destroy

    redirect_to("/people", { :notice => "Person deleted successfully." } )
  end
end
