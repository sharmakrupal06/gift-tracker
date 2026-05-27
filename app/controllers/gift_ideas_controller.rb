class GiftIdeasController < ApplicationController
  before_action :require_authentication
  before_action :set_person

  def create
    the_idea = @the_person.gift_ideas.build
    the_idea.description = params.fetch("query_description")
    the_idea.purchased = false

    if the_idea.save
      redirect_to("/people/#{@the_person.id}", { :notice => "Gift idea added!" })
    else
      redirect_to("/people/#{@the_person.id}", { :alert => the_idea.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_idea = @the_person.gift_ideas.find(params[:id])
    the_idea.destroy

    redirect_to("/people/#{@the_person.id}", { :notice => "Gift idea removed." })
  end

  def update
    the_idea = @the_person.gift_ideas.find(params[:id])
    the_idea.purchased = params.fetch("query_purchased", false)

    if the_idea.save
      redirect_to("/people/#{@the_person.id}", { :notice => "Gift idea updated!" })
    else
      redirect_to("/people/#{@the_person.id}", { :alert => the_idea.errors.full_messages.to_sentence })
    end
  end

  private

  def set_person
    @the_person = current_user.people.find(params[:person_id])
  end
end
