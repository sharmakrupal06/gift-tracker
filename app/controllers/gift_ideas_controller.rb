class GiftIdeasController < ApplicationController
  def create
    the_person = Person.find(params[:person_id])
    the_idea = the_person.gift_ideas.build
    the_idea.description = params.fetch("query_description")
    the_idea.purchased = false

    if the_idea.save
      redirect_to("/people/#{the_person.id}", { :notice => "Gift idea added!" })
    else
      redirect_to("/people/#{the_person.id}", { :alert => the_idea.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_person = Person.find(params[:person_id])
    the_idea = the_person.gift_ideas.find(params[:id])
    the_idea.destroy

    redirect_to("/people/#{the_person.id}", { :notice => "Gift idea removed." })
  end

  def update
    the_person = Person.find(params[:person_id])
    the_idea = the_person.gift_ideas.find(params[:id])
    the_idea.purchased = params.fetch("query_purchased", false)

    if the_idea.save
      redirect_to("/people/#{the_person.id}", { :notice => "Gift idea updated!" })
    else
      redirect_to("/people/#{the_person.id}", { :alert => the_idea.errors.full_messages.to_sentence })
    end
  end
end
