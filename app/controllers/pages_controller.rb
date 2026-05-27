class PagesController < ApplicationController
  skip_before_action :require_authentication, only: [:about]

  def about
    render({ :template => "pages/about" })
  end
end
