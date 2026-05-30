class HomeController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]
  def index
    render inertia: {}
  end
end
