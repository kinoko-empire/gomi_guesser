class Admin::DashboardController < ApplicationController
  def index
    render inertia: { user: 1 }
  end
end
