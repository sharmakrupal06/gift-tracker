class GiftsGivensController < ApplicationController
  def index
    matching_gifts_givens = GiftsGiven.all

    @list_of_gifts_givens = matching_gifts_givens.order({ :created_at => :desc })

    render({ :template => "gifts_given_templates/index" })
  end

  def show
    the_id = params[:id]

    matching_gifts_givens = GiftsGiven.where({ :id => the_id })

    @the_gifts_given = matching_gifts_givens.at(0)

    render({ :template => "gifts_given_templates/show" })
  end

  def create
    the_gifts_given = GiftsGiven.new
    the_gifts_given.gift = params.fetch("query_gift")
    the_gifts_given.person_id = params[:person_id]
    the_gifts_given.liked = params.fetch("query_liked", false)
    the_gifts_given.given_on = params.fetch("query_given_on")
    the_gifts_given.notes = params.fetch("query_notes")
    the_gifts_given.occasion = params.fetch("query_occasion")
    the_gifts_given.price = params.fetch("query_price")

    if the_gifts_given.valid?
      the_gifts_given.save
      redirect_to("/people/#{the_gifts_given.person_id}", { :notice => "Gift created successfully." })
    else
      redirect_to("/people/#{the_gifts_given.person_id}", { :alert => the_gifts_given.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params[:id]
    the_gifts_given = GiftsGiven.where({ :id => the_id }).at(0)
    the_gifts_given.person_id = params[:person_id]
    the_gifts_given.gift = params.fetch("query_gift")
    the_gifts_given.liked = params.fetch("query_liked", false)
    the_gifts_given.given_on = params.fetch("query_given_on")
    the_gifts_given.notes = params.fetch("query_notes")
    the_gifts_given.occasion = params.fetch("query_occasion")
    the_gifts_given.price = params.fetch("query_price")

    if the_gifts_given.valid?
      the_gifts_given.save
      redirect_to("/people/#{the_gifts_given.person_id}", { :notice => "Gift updated successfully." })
    else
      redirect_to("/people/#{the_gifts_given.person_id}", { :alert => the_gifts_given.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params[:id]
    the_gifts_given = GiftsGiven.where({ :id => the_id }).at(0)

    the_gifts_given.destroy

    redirect_to("/people", { :notice => "Gift deleted successfully." })
  end
end
