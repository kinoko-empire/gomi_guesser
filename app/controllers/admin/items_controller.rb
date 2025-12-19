class Admin::ItemsController < ApplicationController
  def index
    render inertia: { user: 1 }
  end

  def edit
    render inertia: { user: 1 }
  end

  def show
    render inertia: { user: 2 }
  end
end
